package com.dalbit.menu.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.menu.service.Men_SpecialService;
import com.dalbit.menu.service.RecommendService;
import com.dalbit.menu.vo.RecommendVo;
import com.dalbit.menu.vo.SpecialReqVo;
import com.dalbit.menu.vo.SpecialVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/menu/special")
public class Men_SpecialRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    RecommendService recommendService;

    @Autowired
    Men_SpecialService menSpecialService;

    @RequestMapping("list")
    public String list(){

        RecommendVo recommendVo = new RecommendVo();
//        recommendVo.setOrderColumnName("recommend");
        List<RecommendVo> recommendVoList = recommendService.getRecommendList(recommendVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, recommendVoList));
    }

    /**
     * 스페셜 달D 신청 목록 조회
     */
    @RequestMapping("reqDalList")
    public String reqDalList(SpecialReqVo specialReqVo){
        String result = menSpecialService.getReqSpecialList(specialReqVo);
        return result;
    }

    /**
     * 스페셜 달D 목록 조회
     */
    @RequestMapping("dalList")
    public String dalList(SpecialVo specialVo){
        String result = menSpecialService.getSpecialList(specialVo);
        return result;
    }
}
