package com.dalbit.customer.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.vo.procedure.P_QuestionListOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Cus_QuestionDao {
    ArrayList<P_QuestionListOutputVo> callQuestionList(ProcedureVo procedureVo);
}
