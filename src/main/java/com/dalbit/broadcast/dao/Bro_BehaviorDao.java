package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_BehaviorListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;


@Repository
public interface Bro_BehaviorDao {

    @Transactional(readOnly = true)
    ArrayList<P_BehaviorListOutputVo> callBehaviorList(ProcedureVo procedureVo);
}
