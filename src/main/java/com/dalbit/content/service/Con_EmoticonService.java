package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.Con_EmoticonDao;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Service
public class Con_EmoticonService {

    @Autowired
    Con_EmoticonDao emoticonDao;

    @Autowired
    GsonUtil gsonUtil;



    /** 인싸티콘 카테고리 리스트 */
    public String callContentsInssaticonCategoryList(P_bannerListInputVo pBannerListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pBannerListInputVo);
        String result = "";

        //TODO 개발 필요
//        try {
//            int totalCnt = emoticonDao.callContentsInssaticonListCnt(pBannerListInputVo);
//            ArrayList<P_bannerListOutputVo> bannerList = emoticonDao.callContentsInssaticonList(pBannerListInputVo);
//            P_bannerListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_bannerListOutputVo.class);
//
//            if(bannerList != null && bannerList.size() > 0) {
//                result = gsonUtil.toJson(new JsonOutputVo(Status.조회, bannerList, new PagingVo(totalCnt), summary));
//            }else {
//                result = gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
//            }
//
//        }catch (Exception e){
//            e.printStackTrace();
//            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
//        }

        return result;
    }



    /** 인싸티콘 리스트 */
    public String callContentsInssaticonList(P_bannerListInputVo pBannerListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pBannerListInputVo);
        String result = "";

        //TODO 개발 필요
//        try {
//            int totalCnt = emoticonDao.callContentsInssaticonListCnt(pBannerListInputVo);
//            ArrayList<P_bannerListOutputVo> bannerList = emoticonDao.callContentsInssaticonList(pBannerListInputVo);
//            P_bannerListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_bannerListOutputVo.class);
//
//            if(bannerList != null && bannerList.size() > 0) {
//                result = gsonUtil.toJson(new JsonOutputVo(Status.조회, bannerList, new PagingVo(totalCnt), summary));
//            }else {
//                result = gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
//            }
//
//        }catch (Exception e){
//            e.printStackTrace();
//            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
//        }

        return result;
    }

    /** 인싸티콘 상세 */
    public String callContentsInssaticonDetail(P_bannerDetailInputVo pBannerDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pBannerDetailInputVo);
        String result = "";

        //TODO 개발 필요

//        try {
//            P_bannerDetailOutputVo bannerDetail = emoticonDao.callContentsInssaticonDetail(pBannerDetailInputVo);
//
//            if (bannerDetail != null) {
//                result = gsonUtil.toJson(new JsonOutputVo(Status.조회, bannerDetail));
//            } else{
//                result = gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
//            }
//
//        }catch (Exception e){
//            e.printStackTrace();
//            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
//        }

        return result;
    }

    /**
     * 인싸티콘 등록
     */
    public String callContentsInssaticonAdd(P_bannerInsertVo pBannerInsertVo){
        pBannerInsertVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pBannerInsertVo, true);
        String result = "";

        //TODO 개발 필요
//        try{
//            int insertResult = emoticonDao.callContentsInssaticonAdd(pBannerInsertVo);
//
//            if(insertResult > 0){
//                result = gsonUtil.toJson(new JsonOutputVo(Status.생성));
//            }else{
//                result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
//            }
//
//        }catch (Exception e){
//            e.printStackTrace();
//            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
//        }

        return result;
    }

    /**
     * 인싸티콘 수정
     */
    public String callContentsInssaticonEdit(P_bannerUpdateVo pBannerUpdateVo) {
        pBannerUpdateVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pBannerUpdateVo, true);
        String result = "";

        //TODO 개발 필요
//        try{
//            int updateResult = emoticonDao.callContentsInssaticonEdit(pBannerUpdateVo);
//
//            if(updateResult > 0){
//                result = gsonUtil.toJson(new JsonOutputVo(Status.수정));
//            }else{
//                result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
//            }
//
//        }catch (Exception e){
//            e.printStackTrace();
//            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
//        }

        return result;
    }

    /**
     * 인싸티콘 삭제
     */
    public String callContentsInssaticonDelete(P_bannerDeleteVo pBannerDeleteVo) {
        pBannerDeleteVo.setOpName(MemberVo.getMyMemNo());

        int sucCnt=0;
        int failCnt=0;

        String result="";

        //TODO 개발 필요
//        String[] idxs = pBannerDeleteVo.getBanner_idx().split(",");
//        for(int i=0; i < idxs.length; i++) {
//            ProcedureVo procedureVo = new ProcedureVo(new P_bannerDeleteVo(idxs[i]));
//
//            int deleteResult = emoticonDao.callContentsInssaticonDelete(new P_bannerDeleteVo(idxs[i]));
//
//            if (deleteResult > 0) {
//                sucCnt++;
//            } else {
//                failCnt++;
//            }
//        }
//
//        HashMap resultMap = new HashMap();
//        resultMap.put("sucCnt", sucCnt);
//        resultMap.put("failCnt", failCnt);
//
//        if(0 < sucCnt){
//            result = gsonUtil.toJson(new JsonOutputVo(Status.삭제, resultMap));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류, resultMap));
//        }

        return result;
    }

    /**
     * 인싸티콘 순서 저장
     */
    public String callContentsInssaticonOrderEdit(P_bannerDetailInputVo pBannerDetailInputVo) {
        String result = "";

        //TODO 개발 필요
        return result;
    }
}
