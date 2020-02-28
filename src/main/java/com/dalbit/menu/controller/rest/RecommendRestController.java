package com.dalbit.menu.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.menu.service.RecommendService;
import com.dalbit.menu.vo.RecommendVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/menu/recommend")
public class RecommendRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    RecommendService recommendService;

    @RequestMapping("list")
    public String list(){

        RecommendVo recommendVo = new RecommendVo();
        recommendVo.setOrderColumnName("recommend");
        List<RecommendVo> recommendVoList = recommendService.getRecommendList(recommendVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, recommendVoList));
    }
}
