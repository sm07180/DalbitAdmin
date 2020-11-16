package com.dalbit.money.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.service.SmsService;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.procedure.P_MemberSetting;
import com.dalbit.money.dao.Mon_ItemDao;
import com.dalbit.money.vo.Mon_ItemInputVo;
import com.dalbit.money.vo.Mon_ItemOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Service
public class Mon_ItemService {

    @Autowired
    Mon_ItemDao monItemDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    SmsService smsService;
    @Autowired
    Mem_MemberDao mem_MemberDao;

    public String selectChangeItemList(Mon_ItemInputVo monItemInputVo){
        monItemInputVo.setPageStart(monItemInputVo.getPageStart() -1);
        monItemInputVo.setPageStart(monItemInputVo.getPageStart() * monItemInputVo.getPageCnt());
        int changeItemCnt = monItemDao.selectChangeItemCnt(monItemInputVo);

        monItemInputVo.setTotalCnt(changeItemCnt);
        ArrayList<Mon_ItemOutputVo> changeItemList = monItemDao.selectChangeItemList(monItemInputVo);
        Mon_ItemOutputVo outVo = monItemDao.selectChangeItemSummary(monItemInputVo);

        P_MemberSetting setting =  mem_MemberDao.getMemberSetting(changeItemList.get(0).getMem_no());

        var resultMap = new HashMap<>();
        resultMap.put("changeItemCnt", changeItemCnt);
        resultMap.put("changeItemList", changeItemList);
        resultMap.put("changeItemSummary", outVo);
        resultMap.put("setting", setting);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultMap));
    }
}
