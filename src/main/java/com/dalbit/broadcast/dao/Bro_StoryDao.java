package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_StoryListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Bro_StoryDao {
    ArrayList<P_StoryListOutputVo> callStoryList(ProcedureVo procedureVo);
}
