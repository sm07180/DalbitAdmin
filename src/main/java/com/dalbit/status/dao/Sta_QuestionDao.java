package com.dalbit.status.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.status.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Sta_QuestionDao {

    @Transactional(readOnly = true)
    ArrayList<P_QuestionTotalOutDetailVo> callQuestionTotal(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_QuestionSlctOutDetailVo> callQuestionSlct(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_QuestionPlatformOutDetailVo> callQuestionPlatform(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_QuestionUntreatedOutDetailVo> callQuestionUntreated(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_QuestionInfoOutVo> callQuestionInfo(ProcedureVo procedureVo);
}
