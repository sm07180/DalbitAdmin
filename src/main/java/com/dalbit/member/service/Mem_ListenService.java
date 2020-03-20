package com.dalbit.member.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.dao.Mem_ListenDao;
import com.dalbit.member.vo.procedure.P_MemberListenInputVo;
import com.dalbit.member.vo.procedure.P_MemberListenOutputVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class Mem_ListenService {

    @Autowired
    Mem_ListenDao mem_ListenDao;
    @Autowired
    GsonUtil gsonUtil;


    public String getListenHistory(P_MemberListenInputVo pMemberListenInputVo) {

        ProcedureVo procedureVo = new ProcedureVo(pMemberListenInputVo);
        ArrayList<P_MemberListenOutputVo> memberList = mem_ListenDao.callListenHistory(procedureVo);
        P_MemberListenOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_MemberListenOutputVo.class);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보_청취내역보기_성공, memberList, new PagingVo(procedureVo.getRet()), summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보_청취내역보기_실패));
        }
        return result;
    }
}