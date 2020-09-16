package com.dalbit.menu.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.menu.dao.Men_RankDao;
import com.dalbit.menu.vo.*;
import com.dalbit.menu.vo.procedure.P_MainDjRankingVo;
import com.dalbit.menu.vo.procedure.P_MainFanRankingVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Men_RankService {

    @Autowired
    Men_RankDao menRankDao;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * DJ 랭킹 (프로시저)
     */
//    public String callMainDjRanking(P_MainDjRankingVo pMainDjRankingVo) {
//        ProcedureVo procedureVo = new ProcedureVo(pMainDjRankingVo);
//        List<P_MainDjRankingVo> mainDjRankingVoList = menRankDao.callMainDjRanking(procedureVo);
//
//        HashMap mainDjRankingList = new HashMap();
//
//        List<MainDjRankingOutVo> outVoList = new ArrayList<>();
//        for (int i=0; i<mainDjRankingVoList.size(); i++){
//            outVoList.add(new MainDjRankingOutVo(mainDjRankingVoList.get(i)));
//        }
//        ProcedureOutputVo procedureOutputVo = new ProcedureOutputVo(procedureVo, outVoList);
//        HashMap resultMap = new Gson().fromJson(procedureOutputVo.getExt(), HashMap.class);
//        mainDjRankingList.put("list", procedureOutputVo.getOutputBox());
//        mainDjRankingList.put("paging", new PagingVo(DalbitUtil.getIntMap(resultMap, "totalCnt"), DalbitUtil.getIntMap(resultMap, "pageNo"), DalbitUtil.getIntMap(resultMap, "pageCnt")));
//
//        String result;
//        if(0 <= Integer.parseInt(procedureOutputVo.getRet())) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.메인_DJ랭킹조회_성공, mainDjRankingList));
//        } else if (procedureVo.getRet().equals(Status.메인_DJ랭킹조회_요청회원_회원아님.getMessageCode())) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.메인_DJ랭킹조회_요청회원_회원아님));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.메인_DJ랭킹조회_실패));
//        }
//        return result;
//    }

    /**
     * DJ 랭킹
     */
    public String getMainDjRankingList(DjRankingVo djRankingVo) {

        djRankingVo.setPageStart(djRankingVo.getPageStart() -1);
        djRankingVo.setPageStart(djRankingVo.getPageStart() * djRankingVo.getPageCnt());

        djRankingVo.setRankType(DalbitUtil.isEmpty(djRankingVo.getRankType()) ? 1 : djRankingVo.getRankType());

        DjRankingVo outVo = menRankDao.getDjLiveCheck(djRankingVo);
        djRankingVo.setLiveCnt(outVo.getLiveCnt());
        djRankingVo.setLiveDate(outVo.getLiveDate());

        int getMainDjRankingListCnt = menRankDao.getMainDjRankingListCnt(djRankingVo);
        djRankingVo.setTotalCnt(getMainDjRankingListCnt);
        List<DjRankingVo> djRankingList = menRankDao.getMainDjRankingList(djRankingVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.메인_DJ랭킹조회_성공, djRankingList, new PagingVo(djRankingVo.getTotalCnt(), djRankingVo.getPageStart(), djRankingVo.getPageCnt())));
        return result;
    }

    /**
     * 팬 랭킹 (프로시저)
     */
//    public String callMainFanRanking(P_MainFanRankingVo pMainFanRankingVo) {
//        ProcedureVo procedureVo = new ProcedureVo(pMainFanRankingVo);
//        List<P_MainFanRankingVo> mainFanRankingVoList = menRankDao.callMainFanRanking(procedureVo);
//
//        HashMap mainFanRankingList = new HashMap();
//        List<MainFanRankingOutVo> outVoList = new ArrayList<>();
//        for (int i=0; i<mainFanRankingVoList.size(); i++){
//            outVoList.add(new MainFanRankingOutVo(mainFanRankingVoList.get(i)));
//        }
//        ProcedureOutputVo procedureOutputVo = new ProcedureOutputVo(procedureVo, outVoList);
//        HashMap resultMap = new Gson().fromJson(procedureOutputVo.getExt(), HashMap.class);
//        mainFanRankingList.put("list", procedureOutputVo.getOutputBox());
//        mainFanRankingList.put("paging", new PagingVo(DalbitUtil.getIntMap(resultMap, "totalCnt"), DalbitUtil.getIntMap(resultMap, "pageNo"), DalbitUtil.getIntMap(resultMap, "pageCnt")));
//
//        String result;
//        if(0 <= Integer.parseInt(procedureOutputVo.getRet())) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.메인_팬랭킹조회_성공, mainFanRankingList));
//        } else if (procedureVo.getRet().equals(Status.메인_팬랭킹조회_요청회원_회원아님.getMessageCode())) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.메인_팬랭킹조회_요청회원_회원아님));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.메인_팬랭킹조회_실패));
//        }
//        return result;
//    }

    /**
     * 팬 랭킹
     */
    public String getMainFanRankingList(FanRankingVo fanRankingVo) {

        fanRankingVo.setPageStart(fanRankingVo.getPageStart() -1);
        fanRankingVo.setPageStart(fanRankingVo.getPageStart() * fanRankingVo.getPageCnt());


        fanRankingVo.setRankType(DalbitUtil.isEmpty(fanRankingVo.getRankType()) ? 1 : fanRankingVo.getRankType());

        FanRankingVo outVo = menRankDao.getFanLiveCheck(fanRankingVo);
        fanRankingVo.setLiveCnt(outVo.getLiveCnt());
        fanRankingVo.setLiveDate(outVo.getLiveDate());

        int getMainFanRankingListCnt = menRankDao.getMainFanRankingListCnt(fanRankingVo);
        fanRankingVo.setTotalCnt(getMainFanRankingListCnt);
        List<FanRankingVo> fanRankingList = menRankDao.getMainFanRankingList(fanRankingVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.메인_팬랭킹조회_성공, fanRankingList, new PagingVo(fanRankingVo.getTotalCnt(), fanRankingVo.getPageStart(), fanRankingVo.getPageCnt())));

        return result;
    }

    /**
     * 랭킹 어드민 가산점 추가 목록
     */
    public String getAddDjPointList(AddDjPointVo addDjPointVo) {

        addDjPointVo.setPageStart(addDjPointVo.getPageStart() -1);
        addDjPointVo.setPageStart(addDjPointVo.getPageStart() * addDjPointVo.getPageCnt());

        AddDjPointVo outVo = menRankDao.getAddDjLiveCheck(addDjPointVo);
        addDjPointVo.setLiveCnt(outVo.getLiveCnt());
        addDjPointVo.setLiveDate(outVo.getLiveDate());

        int getAddDjPointListCnt = menRankDao.getAddDjPointListCnt(addDjPointVo);
        addDjPointVo.setTotalCnt(getAddDjPointListCnt);
        List<AddDjPointVo> addDjPointList = menRankDao.getAddDjPointList(addDjPointVo);

        String result;
        if(addDjPointList.size() > 0){
            result = gsonUtil.toJson(new JsonOutputVo(Status.DJ가산점조회_성공, addDjPointList, new PagingVo(addDjPointVo.getTotalCnt(), addDjPointVo.getPageStart(), addDjPointVo.getPageCnt())));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.DJ가산점조회_실패));
        }

        return result;
    }
}
