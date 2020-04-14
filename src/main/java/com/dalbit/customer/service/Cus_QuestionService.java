package com.dalbit.customer.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.dao.Cus_QuestionDao;
import com.dalbit.customer.vo.FaqVo;
import com.dalbit.customer.vo.procedure.*;
import com.dalbit.member.vo.MemberVo;
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
public class Cus_QuestionService {

    @Autowired
    Cus_QuestionDao cus_questionDao;
    @Autowired
    GsonUtil gsonUtil;

    public String getQuestionList(P_QuestionListInputVo pQuestionListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pQuestionListInputVo);

        ArrayList<P_QuestionListOutputVo> questionList = cus_questionDao.callQuestionList(procedureVo);
        P_QuestionListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_QuestionListOutputVo.class);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.문의목록조회_성공, questionList, new PagingVo(procedureVo.getRet()),summary));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.문의목록조회_실패));
        }

        return result;
    }

    /**
     *  1:1 문의하기 상세 조회
     */
    public String callServiceCenterQnaDetail(P_QuestionDetailInputVo pQuestionDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pQuestionDetailInputVo);
        cus_questionDao.callServiceCenterQnaDetail(procedureVo);
        P_QuestionDetailOutputVo questionDetail = new Gson().fromJson(procedureVo.getExt(), P_QuestionDetailOutputVo.class);

        String result;

        if(Status.일대일문의상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의상세조회_성공, questionDetail));
        } else if(Status.일대일문의상세조회_문의번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의상세조회_문의번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의상세조회_에러));
        }

        return result;
    }

    /**
     *  1:1 문의하기 처리하기
     */
    public String callServiceCenterQnaOperate(P_QuestionOperateVo pQuestionOperateVo){
        pQuestionOperateVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pQuestionOperateVo,true);
        cus_questionDao.callServiceCenterQnaOperate(procedureVo);

        String result;
        if(Status.일대일문의처리_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리_성공));
        } else if(Status.일대일문의처리_문의번호없음.getMessageCode().equals((procedureVo.getRet()))) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리_문의번호없음));
        } else if(Status.일대일문의처리_이미처리됐음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리_이미처리됐음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리_에러));
        }

        return result;
    }

    public List<FaqVo> getFaqGroupList(){
        return cus_questionDao.getFaqGroupList();
    }

    public List<FaqVo> getFaqSubList(FaqVo faqVo){
        return cus_questionDao.getFaqSubList(faqVo);
    }




    /**
     * 회원 1:1문의 내역 건 수
     */
    public String getQuestionCountTarget(P_QuestionListInputVo pQuestionListInputVo) {
        HashMap<P_QuestionListOutputVo, String> questionList = cus_questionDao.callQuestionCountTarget(pQuestionListInputVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.문의목록조회_성공, questionList));
    }
}
