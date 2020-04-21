package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.member.vo.procedure.P_MemberListOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface PushDao {
    ArrayList<P_pushListOutputVo> callContentsPushList(P_pushListInputVo pPushListInputVo);
    int callContentsPushListCnt(P_pushListInputVo pPushListInputVo);
    P_pushDetailOutputVo callContentsPushDetail(P_pushDetailInputVo pPushDetailInputVo);
    int callContentsPushAdd(P_pushInsertVo pPushInsertVo);
    int callContentsPushEdit(P_pushUpdateVo pPushUpdateVo);
    int callContentsPushDelete(P_pushDeleteVo pPushDeleteVo);


    ProcedureVo callStmpPushAdd(ProcedureVo procedureVo);

    List<P_MemberListOutputVo> selectMemInfo(List arrayList);
}
