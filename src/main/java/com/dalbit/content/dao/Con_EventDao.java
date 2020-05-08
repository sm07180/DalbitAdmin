package com.dalbit.content.dao;

import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Con_EventDao {

    @Transactional(readOnly = true)
    ArrayList<P_EventListOutputVo> callEventList(P_EventListInputVo P_EventListInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_EventListOutputVo> callEventList_End(P_EventListInputVo P_EventListInputVo);

    @Transactional(readOnly = true)
    int callEventList_totalCnt(P_EventListInputVo P_EventListInputVo);

    @Transactional(readOnly = true)
    int callEventList_End_totalCnt(P_EventListInputVo P_EventListInputVo);

    int callEventDelete(P_EventDeleteVo pEventDeleteVo);
    int callEventMemberDelete(P_EventDeleteVo pEventDeleteVo);
    int callEventInsert(P_EventUpdateVo pEventUpdateVo);
    int callEventUpdate(P_EventUpdateVo pEventUpdateVo);

    @Transactional(readOnly = true)
    ArrayList<P_EventMemberListOutputVo> callEventMemberList(P_EventMemberListInputVo P_EventMemberListInputVo);

    @Transactional(readOnly = true)
    int callEventMemberList_totalCnt(P_EventMemberListInputVo P_EventMemberListInputVo);

    @Transactional(readOnly = true)
    int callEventMemberList_winCnt(String mem_no);

    int callEventSelWIn(P_EventMemberSelWinVo pEventMemberSelWinVo);

    @Transactional(readOnly = true)
    ArrayList<P_EventMemberListOutputVo> callEventOverlapApplyList(P_EventMemberListInputVo pEventMemberListInputVo);
}
