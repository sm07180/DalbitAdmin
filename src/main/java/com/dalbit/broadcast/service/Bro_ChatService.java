package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.Bro_ChatDao;
import com.dalbit.broadcast.vo.procedure.P_ChatListInputVo;
import com.dalbit.broadcast.vo.procedure.P_ChatListOutputVo;
import com.dalbit.broadcast.vo.procedure.P_ChatTargetListInputVo;
import com.dalbit.broadcast.vo.procedure.P_ChatTargetListOutputVo;
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
public class Bro_ChatService {

    @Autowired
    Bro_ChatDao bro_ChatDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 생방송 채팅 목록 조회
     */
    public String getChatList(P_ChatListInputVo pChatListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pChatListInputVo);
        ArrayList<P_ChatListOutputVo> ChatList = bro_ChatDao.callChatList(procedureVo);
        P_ChatListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_ChatListOutputVo.class);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_사연목록조회_성공, ChatList, new PagingVo(procedureVo.getRet()),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_사연목록조회_실패));
        }
        return result;
    }

    /**
     * 생방송 채팅 회원 목록 조회
     */
    public String getChatTargetList(P_ChatTargetListInputVo pChatTargetListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pChatTargetListInputVo);
        ArrayList<P_ChatTargetListOutputVo> ChatTargetList = bro_ChatDao.callChatTargetList(procedureVo);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_사연목록조회_성공, ChatTargetList, new PagingVo(procedureVo.getRet())));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_사연목록조회_실패));
        }
        return result;
    }

}
