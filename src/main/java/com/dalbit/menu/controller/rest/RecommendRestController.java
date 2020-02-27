package com.dalbit.menu.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.menu.service.MenuService;
import com.dalbit.menu.vo.RecommendVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/menu/recommend")
public class RecommendRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MenuService menuService;

    @RequestMapping("list")
    public String list(){

        List<RecommendVo> recommendVoList = menuService.getRecommendList(new RecommendVo());
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, recommendVoList));
    }
}
