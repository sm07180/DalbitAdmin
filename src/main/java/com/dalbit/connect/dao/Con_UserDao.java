package com.dalbit.connect.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.connect.vo.procedure.P_UserCurrentOutputVo;
import com.dalbit.connect.vo.procedure.P_UserTotalOutDetailVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Con_UserDao {

    List<P_UserTotalOutDetailVo> callUserTotal(ProcedureVo procedureVo);
    ArrayList<P_UserCurrentOutputVo> callUserCurrent(ProcedureVo procedureVo);
}
