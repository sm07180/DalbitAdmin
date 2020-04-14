package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.PushDao;
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
public class PushService {

    @Autowired
    PushDao pushDao;

    @Autowired
    GsonUtil gsonUtil;


    /** 푸시  리스트 */
    public String callContentsPushList(P_pushListInputVo pPushListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pPushListInputVo);
        String result;

        try {
            int totalCnt = pushDao.callContentsPushListCnt(pPushListInputVo);
            ArrayList<P_pushListOutputVo> pushList = pushDao.callContentsPushList(pPushListInputVo);
            P_pushListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_pushListOutputVo.class);

            if(pushList != null && pushList.size() > 0) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시조회_성공, pushList, new PagingVo(totalCnt), summary));
            }else {
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시조회_데이터없음));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시조회_에러));
        }

        return result;
    }

    /** 푸시  상세 */
    public String callContentsPushDetail(P_pushDetailInputVo pPushDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pPushDetailInputVo);
        String result;

        try {
            P_pushDetailOutputVo pushDetail = pushDao.callContentsPushDetail(pPushDetailInputVo);

            if (pushDetail != null) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시상세조회_성공, pushDetail));
            } else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시상세조회_상품코드없음));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시상세조회_에러));
        }

        return result;
    }

    /**
     * 푸시  등록
     */
    public String callContentsPushAdd(P_pushInsertVo pPushInsertVo){
        pPushInsertVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pPushInsertVo, true);
        String result;

        try{
            int insertResult = pushDao.callContentsPushAdd(pPushInsertVo);

            if(insertResult > 0){
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_성공));
            }else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_에러));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_에러));
        }

        return result;
    }

    /**
     * 푸시  수정
     */
    public String callContentsPushEdit(P_pushUpdateVo pPushUpdateVo) {
        pPushUpdateVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pPushUpdateVo, true);
        String result;

        try{
            int updateResult = pushDao.callContentsPushEdit(pPushUpdateVo);

            if(updateResult > 0){
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시수정_성공));
            }else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시수정_실패));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시수정_에러));
        }

        return result;
    }

    /**
     * 푸시  삭제
     */
    public String callContentsPushDelete(P_pushDeleteVo pPushDeleteVo) {
        pPushDeleteVo.setOpName(MemberVo.getMyMemNo());

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pPushDeleteVo.getPush_idx().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_pushDeleteVo(idxs[i]));

            int deleteResult = pushDao.callContentsPushDelete(pPushDeleteVo);

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
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시삭제_성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시삭제_실패, resultMap));
        }

        return result;
    }
    


    public String callStmpPushAdd(P_pushInsertVo pPushInsertVo) {
        ProcedureVo procedureVo = new ProcedureVo(pPushInsertVo);

        pushDao.callStmpPushAdd(procedureVo);

        String result;
        if(Status.푸시등록_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_성공));
        } else if(Status.푸시등록_요청회원번호미존재.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_요청회원번호미존재));
        } else if(Status.푸시등록_디바이스토큰미존재.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_디바이스토큰미존재));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_에러));
        }

        return result;
    }
}
