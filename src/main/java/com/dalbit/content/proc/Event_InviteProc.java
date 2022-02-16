package com.dalbit.content.proc;

import com.dalbit.content.vo.procedure.P_InviteInputVo;
import com.dalbit.content.vo.procedure.P_InviteStateOutputVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Event_InviteProc {
    @ResultMap({"ResultMap.P_InviteStateOutputVo"})
    @Select("CALL rd_admin.p_adm_evt_invitation_member_day_stat(#{tDate})")
    List<P_InviteStateOutputVo> getInviteState(P_InviteInputVo pInviteInputVo);

    @ResultMap({"ResultMap.integer", "ResultMap.P_InviteListOutputVo"})
    @Select("CALL rd_admin.p_adm_evt_invitation_member_list(#{searchVal}, #{searchSlct}, #{pageNo}, #{pagePerCnt})")
    List<Object> getInviteList(P_InviteInputVo pInviteInputVo);

    @ResultMap({"ResultMap.integer", "ResultMap.P_InviteRecvListOutputVo"})
    @Select("CALL rd_admin.p_adm_evt_invitation_rcv_member_list(#{memNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> getInviteRecvList(P_InviteInputVo pInviteInputVo);
}
