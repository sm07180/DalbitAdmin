package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_GiftListInputVo;
import com.dalbit.broadcast.vo.procedure.P_GiftListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Bro_GiftDao {

    @Transactional(readOnly = true)
    ArrayList<P_GiftListOutputVo> callGiftList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_GiftListOutputVo> callGiftList_thumbnail(P_GiftListInputVo pGiftListInputVo);
}
