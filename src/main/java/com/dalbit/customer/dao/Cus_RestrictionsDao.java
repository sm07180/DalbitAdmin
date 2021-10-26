package com.dalbit.customer.dao;

import com.dalbit.customer.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface Cus_RestrictionsDao {

    @Transactional(readOnly = true)
    int getWithdrawalListCnt(P_WithdrawalListInputVo pWithdrawalListInputVo);

    @Transactional(readOnly = true)
    List<P_WithdrawalListOutputVo> getWithdrawalList(P_WithdrawalListInputVo pWithdrawalListInputVo);

    @Transactional(readOnly = true)
    int getForcedListCnt(P_ForcedListInputVo pForcedListInputVo);

    @Transactional(readOnly = true)
    List<P_ForcedListOutputVo> getForcedList(P_ForcedListInputVo pForcedListInputVo);

    @Transactional(readOnly = true)
    List<P_AgeLimitListOutputVo> getAgeLimitList(P_AgeLimitListInputVo pAgeLimitListInputVo);

    @Transactional(readOnly = true)
    Integer getAgeLimitListCnt(P_AgeLimitListInputVo pAgeLimitListInputVo);
}
