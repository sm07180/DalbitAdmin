package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_StoryListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Bro_StoryDao {
    @Transactional(readOnly = true)
    ArrayList<P_StoryListOutputVo> callStoryList(ProcedureVo procedureVo);

    ProcedureVo callStoryDelete(ProcedureVo procedureVo);
}
