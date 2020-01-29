package com.dalbit.sample.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.sample.service.SampleService;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}
