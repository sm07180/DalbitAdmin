package com.dalbit.member.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.dao.Mem_NoticeDao;
import com.dalbit.member.vo.procedure.P_MemberNoticeDeleteVo;
import com.dalbit.member.vo.procedure.P_MemberNoticeInputVo;
import com.dalbit.member.vo.procedure.P_MemberNoticeOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Mem_NoticeService {

    @Autowired
    Mem_NoticeDao mem_NoticeDao;
    @Autowired
    GsonUtil gsonUtil;

    public String getNoticeHistory(P_MemberNoticeInputVo pMemberNoticeInputVo){

//        ProcedureVo procedureVo = new ProcedureVo(pMemberNoticeInputVo);
//        ArrayList<P_MemberNoticeOutputVo> memberList = mem_NoticeDao.callNoticeHistory(procedureVo);

//        if(Integer.parseInt(procedureVo.getRet()) > 0) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.공지보기성공, memberList, new PagingVo(procedureVo.getRet())));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.공지보기실패));
//        }

        ArrayList<P_MemberNoticeOutputVo> memberList = mem_NoticeDao.callNoticeHistory(pMemberNoticeInputVo);
        int memberList_totalCnt = mem_NoticeDao.callNoticeHistory_totalCnt(pMemberNoticeInputVo);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.공지보기성공, memberList, new PagingVo(memberList_totalCnt)));
        log.info(result);
        return result;
    }



    /**
     * 회원 공지 삭제
     */
    public String getNoticeDelete(P_MemberNoticeDeleteVo pMemberNoticeDeleteVo){
        ProcedureVo procedureVo = new ProcedureVo(pMemberNoticeDeleteVo);
        if(pMemberNoticeDeleteVo.getType().equals("1")) {
            mem_NoticeDao.callMemberNoticeDelete(pMemberNoticeDeleteVo);
        }else if(pMemberNoticeDeleteVo.getType().equals("2")) {
            mem_NoticeDao.callBroadNoticeDelete(pMemberNoticeDeleteVo);
        }

        String result = "";
        result = gsonUtil.toJson(new JsonOutputVo(Status.공지삭제_성공));
        return result;
    }
}
