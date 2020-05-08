package com.dalbit.enter.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.enter.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface Ent_JoinDao {

    @Transactional(readOnly = true)
    public List<P_JoinTotalOutDetailVo> callJoinTotal(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    public List<P_JoinGenderOutDetailVo> callJoinGender(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    public List<P_JoinPlatformGenderOutDetailVo> callJoinPlatformGender(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    public List<P_JoinPlatformAgeOutDetailVo> callJoinPlatformAge(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    public List<P_JoinWithdrawOutDetailVo> callJoinWithdraw(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    public List<P_JoinWithdrawOutDetailVo> callStatJoin(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    public List<P_JoinWithdrawOutDetailVo> callStatWithdraw(ProcedureVo procedureVo);
}
