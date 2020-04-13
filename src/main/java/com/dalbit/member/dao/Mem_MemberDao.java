package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Mem_MemberDao {

    ProcedureVo callMemberLogin(ProcedureVo procedureVo);
    ArrayList<P_MemberListOutputVo> callMemberList(ProcedureVo procedureVo);
    P_MemberInfoOutputVo callMemberInfo(ProcedureVo procedureVo);
    P_MemberInfoOutputVo callMemberCertification(P_MemberInfoInputVo pMemberInfoInputVo);
    P_MemberInfoOutputVo callMemberBlock(P_MemberInfoInputVo pMemberInfoInputVo);
    ProcedureVo callNickNameCheck(ProcedureVo procedureVo);
    ArrayList<P_MemberEditHistOutputVo> callMemberEditHistory(ProcedureVo procedureVo);
    ProcedureVo callMemberEditor(ProcedureVo procedureVo);
    int callMemberSocialIdCheck(P_MemberEditorVo pMemberEditorVo);
    int callMemberSocialIdEditor(P_MemberEditorVo pMemberEditorVo);
    int callMemberEditHistoryAdd(P_MemberEditorVo pMemberEditorVo);
    int callMemberStateEditor(P_MemberEditorVo pMemberEditorVo);
    int callMemberWithdrawal_del(P_MemberEditorVo pMemberEditorVo);
    int callMemberBasicAdd(P_MemberEditorVo pMemberEditorVo);
    int callMemberWithdrawal_bak_del(P_MemberEditorVo pMemberEditorVo);
    int callMemberReport(P_MemberReportVo pMemberReportVo);
    int callMemberBasicReport_Edit(P_MemberReportVo pMemberReportVo);
    int callMemberWithdrawal_Add(P_MemberReportVo pMemberReportVo);
    int callMemberNotification_Add(P_MemberReportVo pMemberReportVo);

    int callMemberWithdrawal_bak_Add(P_MemberReportVo pMemberReportVo);
    int callMemberBasic_del(P_MemberReportVo pMemberReportVo);

    ProcedureVo callMemAdminMemoAdd(ProcedureVo procedureVo);
    ArrayList<P_MemberAdminMemoListOutputVo> callMemAdminMemoList(ProcedureVo procedureVo);
    ArrayList<P_MemberConnectOutputVo> callMemConnect(ProcedureVo procedureVo);
    ArrayList<P_MemberManagerListOutputVo> callMemManagerList(ProcedureVo procedureVo);
    ArrayList<P_MemberBlackListOutputVo> callMemBlackList(ProcedureVo procedureVo);

}
