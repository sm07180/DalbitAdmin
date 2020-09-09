package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.*;
import com.dalbit.content.vo.procedure.*;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

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

    @Transactional(readOnly = true)
    ArrayList<P_EventReplyListOutputVo> callEventReplyList(P_EventReplyListInputVo pEventReplyListInputVo);
    @Transactional(readOnly = true)
    int callEventReplyList_totalCnt(P_EventReplyListInputVo pEventReplyListInputVo);

    int callEventReplyDelete(P_EventReplyDeleteInputVo pEventReplyDeleteInputVo);

    @Transactional(readOnly = true)
    ArrayList<AttendanceVo> selectAttendanceList(AttendanceVo attendanceVo);
    @Transactional(readOnly = true)
    int selectAttendanceListCnt(AttendanceVo attendanceVo);

    @Transactional(readOnly = true)
    List<AttendanceCalendarVo> selectAttendanceCalendarList(AttendanceCalendarVo attendanceCalendarVo);
    @Transactional(readOnly = true)
    AttendanceCalendarVo selectAttendanceWeekCalendarList(AttendanceCalendarVo attendanceCalendarVo);
    @Transactional(readOnly = true)
    AttendanceBonusVo selectAttendanceBonus(AttendanceBonusVo attendanceBonusVo);

    @Transactional(readOnly = true)
    int selectGiftconCnt(AttendanceGiftconVo attendanceGiftconVo);
    @Transactional(readOnly = true)
    List<AttendanceGiftconVo> selectGiftconList(AttendanceGiftconVo attendanceGiftconVo);

    @Transactional(readOnly = true)
    int selectPhotoShotCnt(PhotoShotVo photoShotVo);
    @Transactional(readOnly = true)
    List<PhotoShotVo> selectPhotoShotList(PhotoShotVo photoShotVo);

    int deleteEventMember(PhotoShotVo photoShotVo);

    int deletePhotoShot(PhotoShotVo photoShotVo);

    int updatePhotoGood(PhotoShotVo photoShotVo);

    List<EventMemberVo> selectEventMemberList(EventMemberVo eventMemberVo);
    int selectEventMemberCnt(EventMemberVo eventMemberVo);

    @Transactional(readOnly = true)
    ArrayList<P_EventManagementListOutputVo> callEventManagementList(ProcedureVo procedureVo);

    P_EventManagementInfoOutputVo callEventManagementInfo(ProcedureVo procedureVo);

    ProcedureVo callEventManagementAdd(ProcedureVo procedureVo);

    ProcedureVo callEventManagementEdit(ProcedureVo procedureVo);

    ProcedureVo callEventManagementDelete(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_EventPrizeListOutputVo> callEventPrizeList(ProcedureVo procedureVo);

    ProcedureVo callEventPrizeAdd(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    P_EventPrizeDetailOutputVo callEventPrizeDetail(ProcedureVo procedureVo);

    ProcedureVo callEventPrizeEdit(ProcedureVo procedureVo);

    ProcedureVo callEventPrizeDelete(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_EventWinnerInfoOutputVo> callEventWinnerInfo(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_EventWinnerApplicantOutputVo> callEventWinnerApplicant(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_EventWinnerListOutputVo> callEventWinnerList(ProcedureVo procedureVo);

    ProcedureVo callEventWinnerAdd(ProcedureVo procedureVo);

    ProcedureVo callEventWinnerDelete(ProcedureVo procedureVo);

    ProcedureVo callEventWinnerComplete(ProcedureVo procedureVo);

    ProcedureVo callEventWinnerUpdate(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ProcedureVo callEventAnnouncementInfo(ProcedureVo procedureVo);

    ProcedureVo callEventAnnouncementEdit(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_EventAnnouncementInfoExtVo> selectEventAnnounceListDefault(P_EventManagementEventIdxInputVo pEventManagementEventIdxInputVo);

    /*======================= 기존 이벤트 관리 ======================= */
//    @Transactional(readOnly = true)
//    ArrayList<P_EventListOutputVo> callEventList(P_EventListInputVo P_EventListInputVo);
//
//    @Transactional(readOnly = true)
//    ArrayList<P_EventListOutputVo> callEventList_End(P_EventListInputVo P_EventListInputVo);
//
//    @Transactional(readOnly = true)
//    int callEventList_totalCnt(P_EventListInputVo P_EventListInputVo);
//
//    @Transactional(readOnly = true)
//    int callEventList_End_totalCnt(P_EventListInputVo P_EventListInputVo);
//
//    int callEventDelete(P_EventDeleteVo pEventDeleteVo);
//    int callEventMemberDelete(P_EventDeleteVo pEventDeleteVo);
//    int callEventInsert(P_EventUpdateVo pEventUpdateVo);
//    int callEventUpdate(P_EventUpdateVo pEventUpdateVo);
//
//    @Transactional(readOnly = true)
//    ArrayList<P_EventMemberListOutputVo> callEventMemberList(P_EventMemberListInputVo P_EventMemberListInputVo);
//
//    @Transactional(readOnly = true)
//    int callEventMemberList_totalCnt(P_EventMemberListInputVo P_EventMemberListInputVo);
//
//    @Transactional(readOnly = true)
//    int callEventMemberList_winCnt(String mem_no);
//
//    int callEventSelWIn(P_EventMemberSelWinVo pEventMemberSelWinVo);
//
//    @Transactional(readOnly = true)
//    ArrayList<P_EventMemberListOutputVo> callEventOverlapApplyList(P_EventMemberListInputVo pEventMemberListInputVo);
//
//    @Transactional(readOnly = true)
//    ArrayList<P_EventReplyListOutputVo> callEventReplyList(P_EventReplyListInputVo pEventReplyListInputVo);
//    @Transactional(readOnly = true)
//    int callEventReplyList_totalCnt(P_EventReplyListInputVo pEventReplyListInputVo);
//
//    int callEventReplyDelete(P_EventReplyDeleteInputVo pEventReplyDeleteInputVo);
}
