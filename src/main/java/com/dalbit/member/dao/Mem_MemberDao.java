package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface Mem_MemberDao {

    @Transactional(readOnly = true)
    ProcedureVo callMemberLogin(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberListOutputVo> callMemberList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    P_MemberInfoOutputVo callMemberInfo(ProcedureVo procedureVo);

    P_MemberInfoOutputVo callMemberCertification(P_MemberInfoInputVo pMemberInfoInputVo);

    @Transactional(readOnly = true)
    P_MemberInfoOutputVo callMemberTestId(P_MemberInfoInputVo pMemberInfoInputVo);

    @Transactional(readOnly = true)
    P_MemberInfoOutputVo callMemberBlock(P_MemberInfoInputVo pMemberInfoInputVo);

    @Transactional(readOnly = true)
    ProcedureVo callNickNameCheck(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberEditHistOutputVo> callMemberEditHistory(ProcedureVo procedureVo);

    ProcedureVo callMemberEditor(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    int callMemberSocialIdCheck(P_MemberEditorVo pMemberEditorVo);

    int callMemberSocialIdEditor(P_MemberEditorVo pMemberEditorVo);
    int callMemberEditHistoryAdd(P_MemberEditorVo pMemberEditorVo);
    int callMemberStateEditor(P_MemberEditorVo pMemberEditorVo);
    int callMemberWithdrawal_del(P_MemberEditorVo pMemberEditorVo);
    int callMemberBasicAdd(P_MemberEditorVo pMemberEditorVo);
    int callMemberWithdrawal_bak_del(P_MemberEditorVo pMemberEditorVo);
    int callMemberReport(P_MemberReportVo pMemberReportVo);

    @Transactional(readOnly = true)
    int callMemberBroadCasting_check(P_MemberReportVo pMemberReportVo);

    int callMemberBasicReport_Edit(P_MemberReportVo pMemberReportVo);
    int callMemberWithdrawal_Add(P_MemberReportVo pMemberReportVo);
    int callMemberWithdrawal_fanDel(P_MemberReportVo pMemberReportVo);
    int callMemberWithdrawal_starDel(P_MemberReportVo pMemberReportVo);
    int callMemberNotification_Add(P_MemberReportVo pMemberReportVo);

    int callMemberWithdrawal_bak_Add(P_MemberReportVo pMemberReportVo);
    int callMemberBasic_del(P_MemberReportVo pMemberReportVo);

    ProcedureVo callMemAdminMemoAdd(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberAdminMemoListOutputVo> callMemAdminMemoList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberConnectOutputVo> callMemConnect(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    String callMemConnect_deviceToken(P_MemberConnectInputVo pMemberConnectInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberManagerListOutputVo> callMemManagerList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberBlackListOutputVo> callMemBlackList(ProcedureVo procedureVo);

    // 달 추가
    @Transactional(readOnly = true)
    int callMemberBeforDelCnt(P_MemberEditorVo pMemberEditorVo);
    int callMemberAddDal(P_MemberEditorVo pMemberEditorVo);
    int callMemberAddDal_history(P_MemberEditorVo pMemberEditorVo);
    int callMemberBeforByeolCnt(P_MemberEditorVo pMemberEditorVo);
    int callMemberAddByeol(P_MemberEditorVo pMemberEditorVo);
    int callMemberAddByeol_history(P_MemberEditorVo pMemberEditorVo);
    int callMemberEdit_date(P_MemberEditorVo pMemberEditorVo);
}
