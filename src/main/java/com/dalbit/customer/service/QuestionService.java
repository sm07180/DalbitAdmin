package com.dalbit.customer.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.common.code.*;
import com.dalbit.customer.dao.QuestionDao;
import com.dalbit.customer.vo.QuestionVo;
import com.dalbit.customer.vo.procedure.P_QuestionDetailInputVo;
import com.dalbit.customer.vo.procedure.P_QuestionDetailOutputVo;
import com.dalbit.customer.vo.procedure.P_QuestionOperateVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class QuestionService {

    @Autowired
    QuestionDao questionDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    public List<QuestionVo> getQuestionList(QuestionVo questionVo) {
        List<QuestionVo> list = questionDao.questionList(questionVo);
        int questionList_cnt = questionDao.questionList_cnt(questionVo);
        list.get(0).setTotalCnt(questionList_cnt);
        return list;
    }

    /**
     *  1:1 문의하기 상세 조회
     */
    public String callServiceCenterQnaDetail(P_QuestionDetailInputVo pQuestionDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pQuestionDetailInputVo);
        questionDao.callServiceCenterQnaDetail(procedureVo);
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
        ProcedureVo procedureVo = new ProcedureVo(pQuestionOperateVo);
        questionDao.callServiceCenterQnaOperate(procedureVo);

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
        log.info(pQuestionOperateVo.getQnaIdx() +", "+ pQuestionOperateVo.getAnswer() + ", "+ pQuestionOperateVo.getOpName()+ "#################"); // qnatIdx 넘어옴

        return result;
    }

}
