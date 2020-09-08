package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_GuestListOutputVo;
import com.dalbit.broadcast.vo.procedure.P_ListenListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Bro_GuestDao {

    @Transactional(readOnly = true)
    ArrayList<P_GuestListOutputVo> callGuestList(ProcedureVo procedureVo);


}
