package com.dalbit.menu.controller.rest;

import com.dalbit.menu.service.Men_RankService;
import com.dalbit.menu.vo.*;
import com.dalbit.menu.vo.procedure.P_MainDjRankingVo;
import com.dalbit.menu.vo.procedure.P_MainFanRankingVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Slf4j
@RestController
@RequestMapping("rest/menu/rank")
public class Men_RankRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Men_RankService menRankService;


//    @RequestMapping("djRankList")
//    public String djRankList(@Valid MainDjRankingVo mainDjRankingVo, BindingResult bindingResult, HttpServletRequest request){
//
//        P_MainDjRankingVo apiData = new P_MainDjRankingVo(mainDjRankingVo, request);
//
//        String result = menRankService.callMainDjRanking(apiData);
//        return result;
//    }

    @RequestMapping("djRankList")
    public String djRankList(DjRankingVo djRankingVo) {
        return menRankService.getMainDjRankingList(djRankingVo);
    }

//    @RequestMapping("fanRankList")
//    public String fanRankList(@Valid MainFanRankingVo mainFanRankingVo, BindingResult bindingResult, HttpServletRequest request){
//
//        P_MainFanRankingVo apiData = new P_MainFanRankingVo(mainFanRankingVo, request);
//
//        String result = menRankService.callMainFanRanking(apiData);
//        return result;
//    }

    @RequestMapping("fanRankList")
    public String fanRankList(FanRankingVo fanRankingVo) {
        return menRankService.getMainFanRankingList(fanRankingVo);
    }

    @RequestMapping("addDjPoint")
    public String addDjPoint(AddDjPointVo addDjPointVo) {
        return menRankService.getAddDjPointList(addDjPointVo);
    }
}
