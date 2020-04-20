package com.dalbit.content.dao;

import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Con_EventDao {

    ArrayList<P_EventListOutputVo> callEventList(P_EventListInputVo P_EventListInputVo);
    ArrayList<P_EventListOutputVo> callEventList_End(P_EventListInputVo P_EventListInputVo);
    int callEventList_totalCnt(P_EventListInputVo P_EventListInputVo);
    int callEventList_End_totalCnt(P_EventListInputVo P_EventListInputVo);
    int callEventInsert(P_EventUpdateVo pEventUpdateVo);
    int callEventUpdate(P_EventUpdateVo pEventUpdateVo);
    ArrayList<P_EventMemberListOutputVo> callEventMemberList(P_EventMemberListInputVo P_EventMemberListInputVo);
    int callEventMemberList_totalCnt(P_EventMemberListInputVo P_EventMemberListInputVo);
    int callEventMemberList_winCnt(String mem_no);
    int callEventSelWIn(P_EventMemberSelWinVo pEventMemberSelWinVo);

    ArrayList<P_EventMemberListOutputVo> callEventOverlapApplyList(P_EventMemberListInputVo pEventMemberListInputVo);
}
