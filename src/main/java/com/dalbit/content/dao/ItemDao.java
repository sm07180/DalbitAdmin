package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface ItemDao {
    ArrayList<P_itemChargeListOutputVo> callContentsChargeItemList(ProcedureVo procedureVo);
    P_itemChargeDetailOutputVo callContentsChargeItemDetail(ProcedureVo procedureVo);
    ProcedureVo callContentsChargeItemAdd(ProcedureVo procedureVo);
    ProcedureVo callContentsChargeItemEdit(ProcedureVo procedureVo);
    ProcedureVo callContentsChargeItemDelete(ProcedureVo procedureVo);

    ArrayList<P_itemExchangeListOutputVo> callContentsExchangeItemList(ProcedureVo procedureVo);
    P_itemExchangeDetailOutputVo callContentsExchangeItemDetail(ProcedureVo procedureVo);
    ProcedureVo callContentsExchangeItemAdd(ProcedureVo procedureVo);
    ProcedureVo callContentsExchangeItemEdit(ProcedureVo procedureVo);
    ProcedureVo callContentsExchangeItemDelete(ProcedureVo procedureVo);

    ArrayList<P_itemGiftListOutputVo> callContentsGiftItemList(ProcedureVo procedureVo);
    P_itemGiftDetailOutputVo callContentsGiftItemDetail(ProcedureVo procedureVo);
    ProcedureVo callContentsGiftItemAdd(ProcedureVo procedureVo);
    ProcedureVo callContentsGiftItemEdit(ProcedureVo procedureVo);
    ProcedureVo callContentsGiftItemDelete(ProcedureVo procedureVo);

    ArrayList<P_itemGiftListOutputVo> callServiceCenterItemGiftList(ProcedureVo procedureVo);


}
