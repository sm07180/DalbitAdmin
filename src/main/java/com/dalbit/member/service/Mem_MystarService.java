package com.dalbit.member.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.member.dao.Mem_MystarDao;
import com.dalbit.member.vo.procedure.P_MemberMystarInputVo;
import com.dalbit.member.vo.procedure.P_MemberMystarOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Mem_MystarService {

    @Autowired
    Mem_MystarDao mem_MystarDao;
    @Autowired
    GsonUtil gsonUtil;

    public String getMystarHistory(P_MemberMystarInputVo pMemberMystarInputVo){

//        ProcedureVo procedureVo = new ProcedureVo(pMemberMystarInputVo);
//        ArrayList<P_MemberMystarOutputVo> memberList = mem_MystarDao.callMystarHistory(procedureVo);

//        if(Integer.parseInt(procedureVo.getRet()) > 0) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.MyStar목록보기성공, memberList, new PagingVo(procedureVo.getRet())));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.MyStar목록보기실패));
//        }


        pMemberMystarInputVo.setPageNo(pMemberMystarInputVo.getPageNo() -1);
        pMemberMystarInputVo.setPageNo(pMemberMystarInputVo.getPageNo() * pMemberMystarInputVo.getPageCnt());

        ArrayList<P_MemberMystarOutputVo> memberList = mem_MystarDao.callMystarHistory(pMemberMystarInputVo);
        int memberList_totalCnt = mem_MystarDao.callMystarHistory_totalCnt(pMemberMystarInputVo);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.MyStar목록보기성공, memberList, new PagingVo(memberList_totalCnt)));
        log.info(result);
        return result;
    }


    public String getFanHistory(P_MemberMystarInputVo pMemberMystarInputVo){

//        ProcedureVo procedureVo = new ProcedureVo(pMemberMyfanInputVo);
//        ArrayList<P_MemberMyfanOutputVo> memberList = mem_MyfanDao.callMyfanHistory(procedureVo);

//        if(Integer.parseInt(procedureVo.getRet()) > 0) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.Fan목록보기성공, memberList, new PagingVo(procedureVo.getRet())));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.Fan목록보기실패));
//        }

        pMemberMystarInputVo.setPageNo(pMemberMystarInputVo.getPageNo() -1);
        pMemberMystarInputVo.setPageNo(pMemberMystarInputVo.getPageNo() * pMemberMystarInputVo.getPageCnt());

        ArrayList<P_MemberMystarOutputVo> memberList = mem_MystarDao.callMyfanHistory(pMemberMystarInputVo);
        int memberList_totalCnt = mem_MystarDao.callMyfanHistory_totalCnt(pMemberMystarInputVo);
//
        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.Fan목록보기성공, memberList, new PagingVo(memberList_totalCnt)));
        log.info(result);
        return result;
    }
}
