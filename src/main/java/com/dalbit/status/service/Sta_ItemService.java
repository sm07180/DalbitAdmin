package com.dalbit.status.service;


import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.common.vo.StatVo;
import com.dalbit.status.dao.Sta_ItemDao;
import com.dalbit.status.vo.procedure.P_ItemLiveOutputVo;
import com.dalbit.status.vo.procedure.P_ItemTotalOutDetailVo;
import com.dalbit.status.vo.procedure.P_ItemTotalOutVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Service
public class Sta_ItemService {

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Sta_ItemDao sta_ItemDao;


    /**
     * 아이템 고정
     */
    public String callItemLive(){
        ProcedureVo procedureVo = new ProcedureVo();
        sta_ItemDao.callItemLive(procedureVo);
        P_ItemLiveOutputVo itemLive = new Gson().fromJson(procedureVo.getExt(), P_ItemLiveOutputVo.class);

        var result = new HashMap<String, Object>();
        result.put("liveInfo", itemLive);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 아이템 총계
     */
    public String callItemTotal(StatVo StatVo){
        ProcedureVo procedureVo = new ProcedureVo(StatVo);
        ArrayList<P_ItemTotalOutDetailVo> detailList = sta_ItemDao.callItemTotal(procedureVo);
        P_ItemTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_ItemTotalOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }
}
