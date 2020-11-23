package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.PushChoiceMemVo;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.member.vo.procedure.P_MemberListOutputVo;
import com.dalbit.member.vo.procedure.P_MemberReportVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface PushDao {

    @Transactional(readOnly = true)
    ArrayList<P_pushListOutputVo> callContentsPushList(P_pushListInputVo pPushListInputVo);

    @Transactional(readOnly = true)
    int callContentsPushListCnt(P_pushListInputVo pPushListInputVo);

    @Transactional(readOnly = true)
    P_pushDetailOutputVo callContentsPushDetail(P_pushDetailInputVo pPushDetailInputVo);

    int callContentsPushAdd(P_pushInsertVo pPushInsertVo);
    int callContentsPushEdit(P_pushUpdateVo pPushUpdateVo);
    int callContentsPushDelete(P_pushDeleteVo pPushDeleteVo);
    ProcedureVo callStmpPushAdd(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    List<P_MemberListOutputVo> selectMemInfo(List arrayList);

    int callContentsNotiAddALL(P_MemberReportVo pMemberReportVo);

    @Transactional(readOnly = true)
    PushChoiceMemVo selectChoiceMember(String memNo);


    int callContentsPushAndroid(P_pushDeleteVo pPushDeleteVo);
    int callContentsPushWeb(P_pushDeleteVo pPushDeleteVo);
    int callContentsPushWebLarge(P_pushDeleteVo pPushDeleteVo);
    int callContentsPushSchedule(P_pushDeleteVo pPushDeleteVo);



}
