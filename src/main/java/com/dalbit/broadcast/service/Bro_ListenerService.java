package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.Bro_ListenerDao;
import com.dalbit.broadcast.vo.procedure.P_BroadcastListenListInputVo;
import com.dalbit.broadcast.vo.procedure.P_BroadcastListenListOutputVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Bro_ListenerService {

    @Autowired
    Bro_ListenerDao bro_ListenerDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    public String getListenerHistory_detail(P_BroadcastListenListInputVo pBroadcastListenListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastListenListInputVo);
        ArrayList<P_BroadcastListenListOutputVo> broadList = bro_ListenerDao.callListener_detail(procedureVo);
        P_BroadcastListenListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_BroadcastListenListOutputVo.class);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_청취자목록조회_성공, broadList, new PagingVo(procedureVo.getRet()),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_청취자목록조회_실패));
        }
        return result;
    }
}
