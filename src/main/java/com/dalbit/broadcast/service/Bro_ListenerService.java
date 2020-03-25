package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.Bro_ListenerDao;
import com.dalbit.broadcast.vo.procedure.P_ListenForceLeaveVo;
import com.dalbit.broadcast.vo.procedure.P_ListenListInputVo;
import com.dalbit.broadcast.vo.procedure.P_ListenListOutputVo;
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

    /**
     * 생방송 청취자 목록 조회
     */
    public String getListenerHistory_detail(P_ListenListInputVo pListenListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pListenListInputVo);
        ArrayList<P_ListenListOutputVo> broadList = bro_ListenerDao.callListener_detail(procedureVo);
        P_ListenListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_ListenListOutputVo.class);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_청취자목록조회_성공, broadList, new PagingVo(procedureVo.getRet()),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_청취자목록조회_실패));
        }
        return result;
    }

    /**
     * 생방송 청취자 강제퇴장
     */
    public String getListenerForceLeave(P_ListenForceLeaveVo pListenForceLeaveVo){
        ProcedureVo procedureVo = new ProcedureVo(pListenForceLeaveVo);
        bro_ListenerDao.callForceLeave(procedureVo);

        String result = "";
        if(Status.생방청취자강제퇴장_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방청취자강제퇴장_성공));
        } else if(Status.생방청취자강제퇴장_회원아님.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방청취자강제퇴장_회원아님));
        } else if(Status.생방청취자강제퇴장_방없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방청취자강제퇴장_방없음));
        } else if(Status.생방청취자강제퇴장_종료된방.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방청취자강제퇴장_종료된방));
        } else if(Status.생방청취자강제퇴장_청취자아님.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방청취자강제퇴장_청취자아님));
        } else if(Status.생방청취자강제퇴장_퇴장한회원.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방청취자강제퇴장_퇴장한회원));
        }
        return result;
    }
}
