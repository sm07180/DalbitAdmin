package com.dalbit.customer.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.dao.Cus_QuestionDao;
import com.dalbit.customer.vo.procedure.P_QuestionListInputVo;
import com.dalbit.customer.vo.procedure.P_QuestionListOutputVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

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
}
