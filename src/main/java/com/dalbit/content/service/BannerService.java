package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.BannerDao;
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
public class BannerService {

    @Autowired
    BannerDao bannerDao;

    @Autowired
    GsonUtil gsonUtil;


    /** 배너 아이템 리스트 */
    public String callContentsBannerList(P_bannerListInputVo pBannerListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pBannerListInputVo);
        String result;

        try {
            int totalCnt = bannerDao.callContentsBannerListCnt(pBannerListInputVo);
            ArrayList<P_bannerListOutputVo> bannerList = bannerDao.callContentsBannerList(pBannerListInputVo);
            P_bannerListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_bannerListOutputVo.class);

            if(bannerList != null && bannerList.size() > 0) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.배너조회_성공, bannerList, new PagingVo(totalCnt), summary));
            }else {
                result = gsonUtil.toJson(new JsonOutputVo(Status.배너조회_데이터없음));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.배너조회_에러));
        }

        return result;
    }

    /** 배너 아이템 상세 */
    public String callContentsBannerDetail(P_bannerDetailInputVo pBannerDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pBannerDetailInputVo);
        String result;

        try {
            P_bannerDetailOutputVo bannerDetail = bannerDao.callContentsBannerDetail(pBannerDetailInputVo);

            if (bannerDetail != null) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.배너상세조회_성공, bannerDetail));
            } else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.배너상세조회_상품코드없음));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.배너상세조회_에러));
        }

        return result;
    }

    /**
     * 배너 아이템 등록
     */
    public String callContentsBannerAdd(P_bannerInsertVo pBannerInsertVo){
        pBannerInsertVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pBannerInsertVo, true);
        String result;

        try{
            int insertResult = bannerDao.callContentsBannerAdd(pBannerInsertVo);

            if(insertResult > 0){
                result = gsonUtil.toJson(new JsonOutputVo(Status.배너등록_성공));
            }else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.배너등록_실패));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.배너등록_실패));
        }

        return result;
    }

    /**
     * 배너 아이템 수정
     */
    public String callContentsBannerEdit(P_bannerUpdateVo pBannerUpdateVo) {
        pBannerUpdateVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pBannerUpdateVo, true);
        String result;

        try{
            int updateResult = bannerDao.callContentsBannerEdit(pBannerUpdateVo);

            if(updateResult > 0){
                result = gsonUtil.toJson(new JsonOutputVo(Status.배너수정_성공));
            }else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.배너수정_실패));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.배너수정_에러));
        }

        return result;
    }

    /**
     * 배너 아이템 삭제
     */
    public String callContentsBannerDelete(P_bannerDeleteVo pBannerDeleteVo) {
        pBannerDeleteVo.setOpName(MemberVo.getMyMemNo());

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pBannerDeleteVo.getBanner_idx().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_bannerDeleteVo(idxs[i]));

            int deleteResult = bannerDao.callContentsBannerDelete(pBannerDeleteVo);

            if (deleteResult > 0) {
                sucCnt++;
            } else {
                failCnt++;
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt){
            result = gsonUtil.toJson(new JsonOutputVo(Status.배너삭제_성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.배너삭제_실패, resultMap));
        }

        return result;
    }

}
