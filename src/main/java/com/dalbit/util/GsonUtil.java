package com.dalbit.util;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.util.adapter.*;
import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@Component
public class GsonUtil {

    @Autowired
    MessageUtil messageUtil;

    public static GsonBuilder getGsonBuilder(){
        return new GsonBuilder().disableHtmlEscaping()
                .registerTypeAdapter(String.class, new StringAdapter())
                .registerTypeAdapter(Integer.class, new IntegerAdapter())
                .registerTypeAdapter(Float.class, new FloatAdapter())
                .registerTypeAdapter(Double.class, new DoubleAdapter())
                .registerTypeAdapter(Boolean.class, new BooleanAdapter())
                .registerTypeAdapter(Date.class, new DateAdapter());
    }

    /**
     * 문자열중 html 태그를 excape 하여 json 형식으로 변환한다.
     *      * @param object
     *      * @return
     */
    public String toJson(Object object){
        return DalbitUtil.getSpclStrCnvr(getGsonBuilder().create().toJson(object));
    }

    /**
     * JsonOutputVo를 json으로 변환 시 html 태그를 excape 하여 json 형식으로 변환한다.
     * @param jsonOutputVo
     * @return
     */
    public String toJson(JsonOutputVo jsonOutputVo){
        return DalbitUtil.getSpclStrCnvr(getGsonBuilder().create().toJson(messageUtil.setJsonOutputVo(jsonOutputVo)));
    }

    public String toJsonAdm(JsonOutputVo jsonOutputVo){
        return DalbitUtil.escapeCharDecode(DalbitUtil.getSpclStrCnvr(convertJsonAdm(messageUtil.setJsonOutputVo(jsonOutputVo))));
    }

    public static GsonBuilder getGsonBuilderAdm(){
        return new GsonBuilder()
                .registerTypeAdapter(String.class, new StringAdapter())
                .registerTypeAdapter(Integer.class, new IntegerAdapter())
                .registerTypeAdapter(Float.class, new FloatAdapter())
                .registerTypeAdapter(Double.class, new DoubleAdapter())
                .registerTypeAdapter(Boolean.class, new BooleanAdapter())
                .registerTypeAdapter(Date.class, new DateAdapter());
    }

    public String toJsonCustomMessage(JsonOutputVo jsonOutputVo){
        return DalbitUtil.escapeCharDecode(convertJsonAdm(jsonOutputVo));
    }

    public String convertJsonAdm(Object object){
        return getGsonBuilderAdm().create().toJson(object);
    }

    /**
     * response를 JsonOutputVo gson으로 응답한다.
     * @param response
     * @param jsonOutputVo
     * @throws IOException
     */
    public void responseJsonOutputVoToJson(HttpServletResponse response, JsonOutputVo jsonOutputVo) throws IOException {
        PrintWriter out = response.getWriter();
        out.print(this.toJson(messageUtil.setJsonOutputVo(jsonOutputVo)));
        out.flush();
        out.close();
    }
}
