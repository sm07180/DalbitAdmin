package com.dalbit.money.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.service.SmsService;
import com.dalbit.common.vo.JsonOutputVo;
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

    public String selectChangeItemList(Mon_ItemInputVo monItemInputVo){

        int changeItemCnt = monItemDao.selectChangeItemCnt(monItemInputVo);

        monItemInputVo.setTotalCnt(changeItemCnt);
        ArrayList<Mon_ItemOutputVo> changeItemList = monItemDao.selectChangeItemList(monItemInputVo);

        var resultMap = new HashMap<>();
        resultMap.put("changeItemCnt", changeItemCnt);
        resultMap.put("changeItemList", changeItemList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultMap));
    }
}