package com.dalbit.broadcast.service;

import com.dalbit.broadcast.dao.Bro_GuestDao;
import com.dalbit.broadcast.vo.procedure.P_GuestListInputVo;
import com.dalbit.broadcast.vo.procedure.P_GuestListOutputVo;
import com.dalbit.broadcast.vo.procedure.P_ProposeListOutputVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.JwtUtil;
import com.dalbit.util.MessageUtil;
import com.dalbit.util.SocketUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Bro_GuestService {

    @Autowired
    Bro_GuestDao broGuestDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    SocketUtil socketUtil;
    @Autowired
    JwtUtil jwtUtil;
    @Autowired
    Mem_MemberDao mem_MemberDao;

    /**
     * 방송 게스트 목록 조회
     */
    public String getGuestList(P_GuestListInputVo pGuestListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pGuestListInputVo);
        ArrayList<P_GuestListOutputVo> list = broGuestDao.callGuestList(procedureVo);

        P_GuestListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_GuestListOutputVo.class);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(procedureVo.getRet()),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        return result;
    }


    /**
     * 게스트 신청 이력
     */
    public String getProposeList(P_GuestListInputVo pGuestListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pGuestListInputVo);
        ArrayList<P_ProposeListOutputVo> list = broGuestDao.callProposeList(procedureVo);

        P_ProposeListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_ProposeListOutputVo.class);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(procedureVo.getRet()),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        return result;
    }
}
