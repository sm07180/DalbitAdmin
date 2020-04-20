package com.dalbit.enter.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.enter.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Ent_JoinDao {

    public List<P_JoinTotalOutDetailVo> callJoinTotal(ProcedureVo procedureVo);
    public List<P_JoinGenderOutDetailVo> callJoinGender(ProcedureVo procedureVo);
    public List<P_JoinPlatformGenderOutDetailVo> callJoinPlatformGender(ProcedureVo procedureVo);
    public List<P_JoinPlatformAgeOutDetailVo> callJoinPlatformAge(ProcedureVo procedureVo);
    public List<P_JoinWithdrawOutDetailVo> callJoinWithdraw(ProcedureVo procedureVo);
}
