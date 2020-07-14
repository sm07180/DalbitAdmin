package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface ItemDao {

    @Transactional(readOnly = true)
    ArrayList<P_itemChargeListOutputVo> callContentsChargeItemList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    P_itemChargeDetailOutputVo callContentsChargeItemDetail(ProcedureVo procedureVo);

    ProcedureVo callContentsChargeItemAdd(ProcedureVo procedureVo);
    ProcedureVo callContentsChargeItemEdit(ProcedureVo procedureVo);
    ProcedureVo callContentsChargeItemDelete(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_itemExchangeListOutputVo> callContentsExchangeItemList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    P_itemExchangeDetailOutputVo callContentsExchangeItemDetail(ProcedureVo procedureVo);

    ProcedureVo callContentsExchangeItemAdd(ProcedureVo procedureVo);
    ProcedureVo callContentsExchangeItemEdit(ProcedureVo procedureVo);
    ProcedureVo callContentsExchangeItemDelete(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_itemGiftListOutputVo> callContentsGiftItemList(ProcedureVo procedureVo);
    @Transactional(readOnly = true)
    P_itemGiftDetailOutputVo callContentsGiftItemDetail(ProcedureVo procedureVo);

    ProcedureVo callContentsGiftItemAdd(ProcedureVo procedureVo);
    ProcedureVo callContentsGiftItemEdit(ProcedureVo procedureVo);
    ProcedureVo callContentsGiftItemDelete(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_itemGiftListOutputVo> callServiceCenterItemGiftList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_QuickListOutputVo> getQuickList();


}
