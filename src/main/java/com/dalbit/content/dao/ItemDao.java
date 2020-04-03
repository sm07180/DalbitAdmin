package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.procedure.P_itemChargeDetailOutputVo;
import com.dalbit.content.vo.procedure.P_itemChargeListOutputVo;
import com.dalbit.content.vo.procedure.P_itemGiftListOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface ItemDao {
    ArrayList<P_itemChargeListOutputVo> callContentsChargeItemList(ProcedureVo procedureVo);
    P_itemChargeDetailOutputVo callContentsChargeItemDetail(ProcedureVo procedureVo);
    ProcedureVo callContentsChargeItemAdd(ProcedureVo procedureVo);
    ProcedureVo callContentsChargeItemEdit(ProcedureVo procedureVo);
    ProcedureVo callContentsChargeItemDelete(ProcedureVo procedureVo);


    ArrayList<P_itemGiftListOutputVo> callServiceCenterItemGiftList(ProcedureVo procedureVo);


}
