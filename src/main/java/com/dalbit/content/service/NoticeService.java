package com.dalbit.content.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.NoticeDao;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.common.code.*;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Service
public class NoticeService {

    @Autowired
    NoticeDao noticeDao;

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;


    /**
     * 사이트 공지 조회
     */
    public String callServiceCenterNoticeList(P_noticeListInputVo pNoticeListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pNoticeListInputVo);

        ArrayList<P_noticeListOutputVo> noticeList = noticeDao.callServiceCenterNoticeList(procedureVo);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, noticeList, new PagingVo(procedureVo.getRet())));
        }else if(Status.공지사항조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지사항조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지사항조회_에러));
        }

        return result;
    }

    /**
     * 사이트 공지 상세 조회
     */
    public String callServiceCenterNoticeListDetail(P_noticeListDetailInputVo pNoticeListDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pNoticeListDetailInputVo);

        noticeDao.callServiceCenterNoticeListDetail(procedureVo);
        P_noticeListDetailOutputVo noticeDetail = new Gson().fromJson(procedureVo.getExt(), P_noticeListDetailOutputVo.class);

        String result;

        if(Status.공지상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지상세조회_성공, noticeDetail));
        } else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지상세조회_공지번호없음));
        }

        return result;
    }

    /**
     * 사이트 공지 등록
     */
    public String callServiceCenterNoticeAdd(P_noticeInsertVo pNoticeInsertVo){
        pNoticeInsertVo.setOpName(MemberVo.getMyMemNo());

        ProcedureVo procedureVo = new ProcedureVo(pNoticeInsertVo);

        noticeDao.callServiceCenterNoticeAdd(procedureVo);

        String result;
        if(Status.공지등록성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지등록성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지등록실패));
        }

        return result;
    }

    /**
     * 사이트 공지 수정
     */
    public String callServiceCenterNoticeUpdate(P_noticeUpdateVo pNoticeUpdateVo) {
        ProcedureVo procedureVo = new ProcedureVo(pNoticeUpdateVo);

        noticeDao.callServiceCenterNoticeUpdate(procedureVo);
        String result;
        if(Status.공지수정성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지수정성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지수정실패));
        }

        return result;
    }

    /**
     * 사이트 공지 삭제
     */
    public String callServiceCenterNoticeDelete(P_noticeDeleteVo pNoticeDeleteVo) {

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pNoticeDeleteVo.getNoticeIdxs().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_noticeDeleteVo(idxs[i]));

            noticeDao.callServiceCenterNoticeDelete(procedureVo);

            if (Status.공지삭제성공.getMessageCode().equals(procedureVo.getRet())) {
                sucCnt++;
            } else {
                failCnt++;
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt){
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지삭제성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지삭제실패, resultMap));
        }

        return result;
    }


}
