package com.dalbit.exception.conrtoller;

import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.procedure.P_ErrorLogVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import com.dalbit.common.code.Status;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;


@Slf4j
@ControllerAdvice
@RestController
public class CommonErrorController {

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    CommonService commonService;


    /**
     *  에러로그 예외처리
     *  false : 로그 적재 안함
     *  true : 로그 적재
     */
    public boolean isSaveLog(GlobalException globalException, HttpServletRequest request, HttpServletResponse response) {
        if(globalException.getStatus() == Status.벨리데이션체크) return false;
        if(globalException.getClass().getSimpleName().toLowerCase().equals("clientabortexception")) return false;

        return true;
    }

    @ExceptionHandler(GlobalException.class)
    public String exceptionHandle(GlobalException globalException, HttpServletRequest request, HttpServletResponse response) {
        DalbitUtil.setHeader(request, response);
        try {
            if(isSaveLog(globalException, request, response)) {
                P_ErrorLogVo errorLogVo = new P_ErrorLogVo();
                errorLogVo.setOs("admin");
                errorLogVo.setDtype(globalException.getMethodName());
                errorLogVo.setMem_no(MemberVo.getMyMemNo());
                errorLogVo.setCtype(request.getRequestURL().toString());
                errorLogVo.setBuild("");
                errorLogVo.setVersion("");
                String desc = "";
                if(!DalbitUtil.isEmpty(globalException.getData())) {
                    desc = "Data : \n" + globalException.getData().toString() + "\n";
                }
                if(!DalbitUtil.isEmpty(globalException.getValidationMessageDetail())) {
                    desc = "Data : \n" + globalException.getValidationMessageDetail().toString() + "\n";
                }
                StringWriter sw = new StringWriter();
                globalException.printStackTrace(new PrintWriter(sw));
                if(sw != null) {
                    desc += "GlobalException : \n" + sw.toString();
                }
                errorLogVo.setDesc(desc);
                commonService.saveErrorLog(errorLogVo, request);
            }
        } catch (Exception e) {}

        if (globalException.getErrorStatus() != null) {
            return gsonUtil.toJson(new JsonOutputVo(globalException.getErrorStatus(), globalException.getData(), globalException.getValidationMessageDetail(), globalException.getMethodName()));
        } else {
            if(globalException.isCustomMessage()) {
                JsonOutputVo jsonOutputVo = new JsonOutputVo();
                jsonOutputVo.setStatus(Status.벨리데이션체크);
                String msg = "";

                try{
                    msg = ((String) globalException.getValidationMessageDetail().get(0)).split(",")[0] + "," + ((String) globalException.getValidationMessageDetail().get(0)).split(",")[2];
                }catch(ArrayIndexOutOfBoundsException ae){
                    msg = (String)globalException.getValidationMessageDetail().get(0);
                }

                jsonOutputVo.setMessage(msg);
                jsonOutputVo.setMethodName(globalException.getMethodName());
                jsonOutputVo.setTimestamp(DalbitUtil.setTimestampInJsonOutputVo());
                return gsonUtil.toJsonCustomMessage(jsonOutputVo);
            }else{
                return gsonUtil.toJson(new JsonOutputVo(globalException.getStatus(), globalException.getData(), globalException.getValidationMessageDetail(), globalException.getMethodName()));
            }
        }
    }

    @ExceptionHandler(Exception.class)
    public String exceptionHandle(Exception exception, HttpServletRequest request, HttpServletResponse response){
        DalbitUtil.setHeader(request, response);
        try {
            P_ErrorLogVo errorLogVo = new P_ErrorLogVo();
            errorLogVo.setOs("admin");
            errorLogVo.setDtype(request.getMethod());
            errorLogVo.setMem_no(MemberVo.getMyMemNo());
            errorLogVo.setCtype(request.getRequestURL().toString());
            String desc = "";
            if(!DalbitUtil.isEmpty(request.getParameterMap())){
                desc = "Data : \n" + gsonUtil.toJson(request.getParameterMap()) + "\n";
            }
            StringWriter sw = new StringWriter();
            exception.printStackTrace(new PrintWriter(sw));
            if(sw != null){
                desc += "Exception : \n" + sw.toString();
            }
            errorLogVo.setDesc(desc);
            commonService.saveErrorLog(errorLogVo, request);
        }catch (Exception e){}

        HashMap map = new HashMap();
        map.put("message", exception.getMessage());
        return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류, map, (ArrayList) null, request.getMethod() + ""));
    }
}