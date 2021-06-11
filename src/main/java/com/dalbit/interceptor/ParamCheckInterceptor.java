package com.dalbit.interceptor;

import com.dalbit.common.code.ErrorStatus;
import com.dalbit.exception.GlobalException;
import com.dalbit.util.DateUtil;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.regex.Pattern;

@Slf4j
public class ParamCheckInterceptor extends HandlerInterceptorAdapter {

    final String intPattern1 = "\\d+";
    final String intPattern2 = "\\-\\d+";
    final String floatPattern1 = "\\d+\\.\\d+";
    final String floatPattern2 = "\\-\\d+\\.\\d+";
    final String datePattern1 = "\\d{8}";
    final String datePattern2 = "\\d{4}[.-]\\d{2}[.-]\\d{2}";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0) {
            ip = request.getRemoteAddr();
        }

        if (ip.equals("0:0:0:0:0:0:0:1")) {
            ip = "127.0.0.1";
        }
        MDC.clear();
        MDC.put("ACCESS_IP", ip);

        for(Enumeration<String> itertor = (Enumeration<String>)request.getParameterNames(); itertor.hasMoreElements();){
            String key = itertor.nextElement();
            if(key.startsWith("i_")){
                String[] values = request.getParameterValues(key);
                if (values != null && values.length > 0){
                    if(values.length == 1){
                        if(checkInteger(values[0]) == false){
                            throw new GlobalException(ErrorStatus.잘못된파람);
                        }
                    }else{
                        for(String value : values){
                            if(value != null && checkInteger(value) == false){
                                throw new GlobalException(ErrorStatus.잘못된파람);
                            }
                        }
                    }
                }
            }else if(key.startsWith("f_")){
                String[] values = request.getParameterValues(key);
                if (values != null && values.length > 0){
                    if(values.length == 1){
                        if(checkFloat(values[0]) == false){
                            throw new GlobalException(ErrorStatus.잘못된파람);
                        }
                    }else{
                        for(String value : values){
                            if(value != null && checkFloat(value) == false){
                                throw new GlobalException(ErrorStatus.잘못된파람);
                            }
                        }
                    }
                }
            }else if(key.startsWith("d_")){
                String[] values = request.getParameterValues(key);
                if (values != null && values.length > 0){
                    if(values.length == 1){
                        if(checkDate(values[0]) == false){
                            throw new GlobalException(ErrorStatus.잘못된파람);
                        }
                    }else{
                        for(String value : values){
                            if(value != null && checkDate(value) == false){
                                throw new GlobalException(ErrorStatus.잘못된파람);
                            }
                        }
                    }
                }
            }
        }

        return true;
    }

    public boolean checkInteger(String value) {
        return Pattern.matches(intPattern1, value) || Pattern.matches(intPattern2, value);
    }

    public boolean checkFloat(String value) {
        return Pattern.matches(intPattern1, value) || Pattern.matches(intPattern2, value) || Pattern.matches(floatPattern1, value) || Pattern.matches(floatPattern2, value);
    }

    public boolean checkDate(String value) {
        return (Pattern.matches(datePattern1, value) || Pattern.matches(datePattern2, value)) &&  DateUtil.isDate(value);
    }
}
