package com.dalbit.security.service;

import com.dalbit.exception.GlobalException;
import com.dalbit.security.vo.InforexLoginLayoutVo;
import com.dalbit.security.vo.SecurityUserVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.OkHttpClientUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import okhttp3.FormBody;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

@Slf4j
@Component("authProvider")
public class AuthenticationProviderImpl implements AuthenticationProvider {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    HttpServletRequest request;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        //String userName = authentication.getName();
        //String password = (String)authentication.getCredentials();

        try {

            var map = new HashMap();
            map.put("userid", DalbitUtil.convertRequestParamToString(request,"memId"));
            map.put("password", DalbitUtil.convertRequestParamToString(request,"memPwd"));
            map.put("mode", "login");
            map.put("where", "dalbit");

            RequestBody formBody = new FormBody.Builder()
                .add("userid", DalbitUtil.convertRequestParamToString(request,"memId"))
                .add("password", DalbitUtil.convertRequestParamToString(request,"memPwd"))
                .add("mode", "login")
                .add("where", "dalbit")
                .build();

            OkHttpClientUtil okHttpClientUtil = new OkHttpClientUtil();

            Response response = okHttpClientUtil.sendPost("http://admin.inforex.co.kr/loginout.html", formBody);
            //log.info("로그인결과 : {}", response.body().string());
            String inforexLoginResult = response.body().string();
            InforexLoginLayoutVo inforexLoginLayoutVo = new Gson().fromJson(inforexLoginResult, InforexLoginLayoutVo.class);


            log.info("로그인 파싱 : {}", inforexLoginLayoutVo);
            log.info("로그인 여부 : {}", inforexLoginLayoutVo.getSuccess());
            log.info("회원정보 : {}", inforexLoginLayoutVo.getUserInfo());

            if(!DalbitUtil.isEmpty(inforexLoginLayoutVo)){
                ArrayList cookieList = (ArrayList)response.headers().toMultimap().get("set-cookie");
                inforexLoginLayoutVo.setLoginCookieVo(DalbitUtil.parseCookieList(cookieList));
            }

        //SecurityUserVo securityUserVo = (SecurityUserVo)userDetailsService.loadUserByUsername("");

        Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

        return new UsernamePasswordAuthenticationToken(
                inforexLoginLayoutVo
                , DalbitUtil.convertRequestParamToString(request,"memPwd")
                , authorities);

        }catch (GlobalException | IOException e){
            log.debug(e.getMessage());
            return null;
        }
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}
