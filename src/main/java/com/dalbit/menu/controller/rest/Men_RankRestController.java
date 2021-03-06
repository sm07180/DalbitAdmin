package com.dalbit.menu.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.menu.service.Men_RankService;
import com.dalbit.menu.vo.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@RestController
@RequestMapping("rest/menu/rank")
public class Men_RankRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Men_RankService menRankService;

    @Autowired
    ExcelService excelService;


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

    @RequestMapping("goodRank")
    public String goodRank(GoodRankVo goodRankVo) {
        return menRankService.getGoodRank(goodRankVo);
    }

    @RequestMapping("awards/vote")
    public String awardsVote(AwardsVoteVo awardsVoteVo) {
        return menRankService.callAwardsVote(awardsVoteVo);
    }

    @RequestMapping("awards/vote/member")
    public String awardsVoteMember(AwardsVoteVo awardsVoteVo) {
        return menRankService.callAwardsVoteMember(awardsVoteVo);
    }

    @PostMapping("awards/vote/listExcel")
    public String awardsVoteListExcel(HttpServletRequest request, HttpServletResponse response, Model model, AwardsVoteVo awardsVoteVo) throws GlobalException {
        Model resultModel = menRankService.callAwardsVoteExcel(awardsVoteVo, model);
        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);

        return gsonUtil.toJson(new JsonOutputVo(Status.????????????????????????));
    }

    @RequestMapping("awards/vote/detail")
    public String awardsVoteDetail(AwardsVoteVo awardsVoteVo) {
        return menRankService.callAwardsVoteDetail(awardsVoteVo);
    }

    @RequestMapping("awards/regist")
    public String awardsRegist(AwardsVoteVo awardsVoteVo) {
        return menRankService.callAwardsRegist(awardsVoteVo);
    }


    /**
     * ?????? ????????? ?????? DJ ??????
     * @param awardsVoteVo
     * @return
     */
    @RequestMapping("awards/dj")
    public String awardsDj(AwardsVoteVo awardsVoteVo) {
        return menRankService.callAwardsDj(awardsVoteVo);
    }

    /**
     * ?????? ????????? ?????? ??? ??????
     * @param awardsVoteVo
     * @return
     */
    @RequestMapping("awards/fan")
    public String awardsFan(AwardsVoteVo awardsVoteVo) {
        return menRankService.callAwardsFan(awardsVoteVo);
    }

    /**
     * ?????? ????????? ?????? DJ ??????/??????
     * @param awardsVoteVo
     * @return
     */
    @RequestMapping("awards/dj/regist")
    public String awardsDjRegist(AwardsVoteVo awardsVoteVo) {
        return menRankService.callAwardsDjRegist(awardsVoteVo);
    }


    /**
     * ?????? ????????? ??????DJ ??????/??? ?????? ??????
     * @param awardsVoteVo
     * @return
     */
    @RequestMapping("awards/dj/sel/impression")
    public String awardsDjSelImpression(AwardsVoteVo awardsVoteVo) {
        return menRankService.callAwardsDjSelImpression(awardsVoteVo);
    }

    /**
     * ?????? ????????? ??????DJ ??????/??? ?????? ??????
     * @param awardsVoteVo
     * @return
     */
    @RequestMapping("awards/dj/add/impression")
    public String awardsDjImpression(AwardsVoteVo awardsVoteVo) {
        return menRankService.callAwardsDjImpression(awardsVoteVo);
    }

}
