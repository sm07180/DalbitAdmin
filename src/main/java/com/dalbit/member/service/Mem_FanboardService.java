package com.dalbit.member.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.dao.Mem_FanboardDao;
import com.dalbit.member.vo.procedure.P_MemberFanboardInputVo;
import com.dalbit.member.vo.procedure.P_MemberFanboardOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Mem_FanboardService {

    @Autowired
    Mem_FanboardDao mem_FanboardDao;
    @Autowired
    GsonUtil gsonUtil;

    public String getFanboardHistory(P_MemberFanboardInputVo pMemberFanboardInputVo){

//        ProcedureVo procedureVo = new ProcedureVo(pMemberFanboardInputVo);
//        ArrayList<P_MemberFanboardOutputVo> memberList = mem_FanboardDao.callFanboardHistory(procedureVo);

//        if(Integer.parseInt(procedureVo.getRet()) > 0) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.Fan목록보기성공, memberList, new PagingVo(procedureVo.getRet())));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.Fan목록보기실패));
//        }

        ArrayList<P_MemberFanboardOutputVo> memberList = mem_FanboardDao.callFanboardHistory(pMemberFanboardInputVo);
        int memberList_totalCnt = mem_FanboardDao.callFanboardHistory_totalCnt(pMemberFanboardInputVo);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.Fan목록보기성공, memberList, new PagingVo(memberList_totalCnt)));
        log.info(result);
        return result;
    }
}
