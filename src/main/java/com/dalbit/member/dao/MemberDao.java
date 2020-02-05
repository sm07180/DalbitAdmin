package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.MemberListVo;
import com.dalbit.member.vo.MemberVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberDao {

    ProcedureVo callNickNameCheck(ProcedureVo procedureVo);
    ProcedureVo callMemberLogin(ProcedureVo procedureVo);
    ProcedureVo callMemberJoin(ProcedureVo procedureVo);
    ProcedureVo callChangePassword(ProcedureVo procedureVo);
    ProcedureVo callMemberInfoView(ProcedureVo procedureVo);

    ProcedureVo callMemberInfo(ProcedureVo procedureVo);

    /* 연습용 */
    List<MemberListVo> getMemberList();
}
