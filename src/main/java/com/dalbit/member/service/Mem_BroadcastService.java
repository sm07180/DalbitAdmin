package com.dalbit.member.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.dao.Mem_BroadcastDao;
import com.dalbit.member.vo.procedure.P_MemberBroadcastInputVo;
import com.dalbit.member.vo.procedure.P_MemberBroadcastOutputVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Service
public class Mem_BroadcastService {

    @Autowired
    Mem_BroadcastDao mem_BroadcastDao;
    @Autowired
    GsonUtil gsonUtil;

    public String getBroadHistory(P_MemberBroadcastInputVo pMemberBroadcastInputVo){

        ProcedureVo procedureVo = new ProcedureVo(pMemberBroadcastInputVo);
        ArrayList<P_MemberBroadcastOutputVo> broacastList = mem_BroadcastDao.callBroadHistory(procedureVo);
        P_MemberBroadcastOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_MemberBroadcastOutputVo.class);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보_방송내역보기_성공, broacastList, new PagingVo(procedureVo.getRet()), summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보_방송내역보기_실패));
        }
        return result;
    }
}
