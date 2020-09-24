package com.dalbit.money.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.money.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Mon_ResourceDao {

    @Transactional(readOnly = true)
    ArrayList<P_ResourceDetailDalOutVo> callResourceDetail_dal(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ResourceDetailByeolOutVo> callResourceDetail_byeol(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_memberDataListOutVo> callMemberDataList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_BuyDalListOutVo> callBuyDalList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_UseDalListOutVo> callUseDalList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_LiveResourceDataOutVo> callResourceLive(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    int getDalPayDetailCnt(P_ResourcePopupInputVo pResourcePopupInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_ResourcePopupOutputVo> getDalPayDetailList(P_ResourcePopupInputVo pResourcePopupInputVo);

    @Transactional(readOnly = true)
    int getDalDirectListCnt(P_ResourcePopupInputVo pResourcePopupInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_ResourcePopupOutputVo> getDalDirectList(P_ResourcePopupInputVo pResourcePopupInputVo);

    @Transactional(readOnly = true)
    int getDalMemberStateCnt(P_ResourcePopupInputVo pResourcePopupInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_ResourcePopupOutputVo> getDalMemberStateList(P_ResourcePopupInputVo pResourcePopupInputVo);
}
