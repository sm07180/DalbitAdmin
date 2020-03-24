package com.dalbit.sample.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.sample.service.SampleService;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.OkHttpClientUtil;
import com.dalbit.util.RestApiUtil;
import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@RestController
@RequestMapping("rest/sample")
public class SampleRestController {

    @Autowired
    SampleService sampleService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("list")
    public String list(Model model){

        ArrayList<HashMap> list = new ArrayList<HashMap>();
        for(int i = 0; i++ < 20;){
            HashMap map = new HashMap();
            map.put("renderingEngine", DalbitUtil.randomValue("string", 10));
            map.put("browser", DalbitUtil.randomValue("string", 6));
            map.put("platform", DalbitUtil.randomValue("string", 9));
            map.put("version", DalbitUtil.randomValue("number", 4));
            map.put("grade", DalbitUtil.randomValue("string", 1));
            list.add(map);
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }

    @PostMapping("menu")
    public String menu(HttpServletRequest request) throws Exception {
        String url = (String)request.getParameter("url");

        OkHttpClientUtil okHttpClientUtil = new OkHttpClientUtil();
        String result = okHttpClientUtil.sendGet(url, request, "/", ".inforex.co.kr");

        return result;
    }
}
