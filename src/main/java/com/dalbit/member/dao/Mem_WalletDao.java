package com.dalbit.member.dao;

import com.dalbit.member.vo.procedure.P_WalletByeolListOutVo;
import com.dalbit.member.vo.procedure.P_WalletByeolVo;
import com.dalbit.member.vo.procedure.P_WalletDalListOutVo;
import com.dalbit.member.vo.procedure.P_WalletDalVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Repository
public interface Mem_WalletDao {

    @Transactional(readOnly = true)
    int callMemberWalletDal_totalCnt(P_WalletDalVo pDalVo);
    @Transactional(readOnly = true)
    List<P_WalletDalListOutVo> callMemberWalletDal(P_WalletDalVo pDalVo);
    @Transactional(readOnly = true)
    HashMap getResultDalSummary(P_WalletDalVo pDalVo);

    @Transactional(readOnly = true)
    int callMemberWalletByeol_totalCnt(P_WalletByeolVo pByeolVo);
    @Transactional(readOnly = true)
    List<P_WalletByeolListOutVo> callMemberWalletByeol(P_WalletByeolVo pByeolVo);
    @Transactional(readOnly = true)
    HashMap getResultByeolSummary(P_WalletByeolVo pDalVo);

}
