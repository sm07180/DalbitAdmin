package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_LiveListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Bro_LiveDao {

    ArrayList<P_LiveListOutputVo> callLiveList(ProcedureVo procedureVo);
}
