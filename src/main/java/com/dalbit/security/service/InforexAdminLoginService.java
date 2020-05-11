package com.dalbit.security.service;

import com.dalbit.common.code.Status;
import com.dalbit.exception.CustomUsernameNotFoundException;
import com.dalbit.exception.GlobalException;
import com.dalbit.security.vo.InforexLoginLayoutVo;
import com.dalbit.util.CookieUtil;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.OkHttpClientUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import okhttp3.FormBody;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@Slf4j
@Service
public class InforexAdminLoginService {

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpServletResponse response;

    public InforexLoginLayoutVo login() throws CustomUsernameNotFoundException {
        RequestBody formBody = new FormBody.Builder()
            .add("userid", DalbitUtil.convertRequestParamToString(request, "memId"))
            .add("password", DalbitUtil.convertRequestParamToString(request, "memPwd"))
            .add("mode", "login")
            .add("where", "dalbit")
            .build();

        return loginProcess(formBody);
    }

    public InforexLoginLayoutVo cookieLogin(String memId, String memPwd) throws CustomUsernameNotFoundException {
        RequestBody formBody = new FormBody.Builder()
                .add("userid", memId)
                .add("password", memPwd)
                .add("mode", "login")
                .add("where", "dalbit")
                .build();

        return loginProcess(formBody);
    }

    public InforexLoginLayoutVo loginProcess(RequestBody formBody) throws CustomUsernameNotFoundException {
        try{

            OkHttpClientUtil okHttpClientUtil = new OkHttpClientUtil();

            Response apiResponse = okHttpClientUtil.sendPost(DalbitUtil.getProperty("inforex.api.login.url"), formBody);
            String inforexLoginResult = apiResponse.body().string();
            InforexLoginLayoutVo inforexLoginLayoutVo = new Gson().fromJson(inforexLoginResult, InforexLoginLayoutVo.class);

            if(DalbitUtil.isEmpty(inforexLoginLayoutVo) || DalbitUtil.isEmpty(inforexLoginLayoutVo.getSuccess())){
                throw new CustomUsernameNotFoundException(Status.로그인실패_API통신이상);

            }else if(inforexLoginLayoutVo.getSuccess().toUpperCase().equals("N")){
                throw new CustomUsernameNotFoundException(Status.로그인실패_패스워드틀림);

            }else if(inforexLoginLayoutVo.getSuccess().toUpperCase().equals("Y")){
                log.info("로그인 파싱 : {}", inforexLoginLayoutVo);
                log.info("로그인 여부 : {}", inforexLoginLayoutVo.getSuccess());
                log.info("회원정보 : {}", inforexLoginLayoutVo.getUserInfo());

                if (!DalbitUtil.isEmpty(inforexLoginLayoutVo)) {
                    ArrayList cookieList = (ArrayList) apiResponse.headers().toMultimap().get("set-cookie");
                    inforexLoginLayoutVo.setLoginCookieVo(DalbitUtil.parseCookieList(cookieList));

                    inforexLoginLayoutVo.getLoginCookieVo().stream().forEach(cookieVo -> {
                        try {
                            response.addCookie(CookieUtil.createCookie(cookieVo.getKey(), cookieVo.getValue(), cookieVo.getDomain(), cookieVo.getPath(), 31536000));
                        }catch (Exception e){

                        }
                    });
                }
            }

            return inforexLoginLayoutVo;

        }catch (IOException | GlobalException e){
            throw new CustomUsernameNotFoundException(Status.로그인실패_API통신이상);
        }
    }
}
