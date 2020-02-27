package com.dalbit.menu.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@RestController
@RequestMapping("rest/menu/recommend")
public class RecommendRestController {

    @Autowired
    GsonUtil gsonUtil;

    @RequestMapping("list")
    public String list(){

        ArrayList list = new ArrayList();

        HashMap map = new HashMap();
        map.put("no", DalbitUtil.randomValue("number", 3));
        map.put("userId", DalbitUtil.randomValue("string", 10));

        list.add(map);

        HashMap map2 = new HashMap();
        map2.put("no", DalbitUtil.randomValue("number", 3));
        map2.put("userId", DalbitUtil.randomValue("string", 10));

        list.add(map2);


        return gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, list));
    }
}
