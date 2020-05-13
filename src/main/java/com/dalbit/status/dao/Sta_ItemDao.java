package com.dalbit.status.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.status.vo.procedure.P_ItemAgeOutDetailVo;
import com.dalbit.status.vo.procedure.P_ItemGenderOutDetailVo;
import com.dalbit.status.vo.procedure.P_ItemLiveOutputVo;
import com.dalbit.status.vo.procedure.P_ItemTotalOutDetailVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Sta_ItemDao {

    @Transactional(readOnly = true)
    ArrayList<P_ItemLiveOutputVo> callItemLive(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ItemTotalOutDetailVo> callItemTotal(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ItemGenderOutDetailVo> callItemGender(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ItemAgeOutDetailVo> callItemAge(ProcedureVo procedureVo);
}
