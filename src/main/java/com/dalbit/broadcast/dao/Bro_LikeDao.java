package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_LikeListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Bro_LikeDao {

    @Transactional(readOnly = true)
    ArrayList<P_LikeListOutputVo> callLikeList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_LikeListOutputVo> callLikeList_withdrawal(String mem_no);
}
