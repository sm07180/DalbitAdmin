package com.dalbit.content.controller.rest;

import com.dalbit.common.code.EventCode;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.service.Con_EventService;
import com.dalbit.content.vo.*;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@RestController
@RequestMapping("rest/content/event")
public class Con_EventRestController {

    @Autowired
    ExcelService excelService;

    @Autowired
    Con_EventService con_EventService;

    @Autowired
    GsonUtil gsonUtil;


    /*======================= 출석 체크 이벤트 ======================= */

    /**
     * 출석 이벤트 리스트 조회
     */
    @PostMapping("/attendance/list")
    public String attendanceList(AttendanceVo attendanceVo) {
        String result = con_EventService.selectAttendanceList(attendanceVo);
        return result;
    }

    @PostMapping("/attendance/calendar/list")
    public String attendanceCalendarList(AttendanceCalendarVo attendanceCalendarVo) {
        String result = con_EventService.selectAttendanceCalendarList(attendanceCalendarVo);
        return result;
    }

    @PostMapping("/attendance/calendar/week")
    public String attendanceCalendarWeek(AttendanceCalendarVo attendanceCalendarVo) {
        String result = con_EventService.selectAttendanceWeekCalendarList(attendanceCalendarVo);
        return result;
    }

    @PostMapping("/attendance/bonus/status")
    public String selectAttendanceBonus(AttendanceBonusVo attendanceBonusVo) {
        String result = con_EventService.selectAttendanceBonus(attendanceBonusVo);
        return result;
    }

    @PostMapping("/attendance/giftconList")
    public String giftconList(AttendanceGiftconVo attendanceGiftconVo) {
        String result = con_EventService.selectGiftconList(attendanceGiftconVo);
        return result;
    }

    @PostMapping("/photo/shot/list")
    public String photoShotList(PhotoShotVo photoShotVo) {
        photoShotVo.setEvent_idx(EventCode.인증샷.getEventIdx());
        String result = con_EventService.selectPhotoShotList(photoShotVo);
        return result;
    }

    @PostMapping("/photo/shot/delete")
    public String photoShotDelete(PhotoShotVo photoShotVo) {
        photoShotVo.setEvent_idx(EventCode.인증샷.getEventIdx());
        String result = con_EventService.deletePhotoShot(photoShotVo);
        return result;
    }

    @PostMapping("/photo/shot/excel")
    public String photoShotExcel(HttpServletRequest request, HttpServletResponse response, Model model, PhotoShotVo photoShotVo) throws GlobalException {

        Model resultModel = con_EventService.getPhotoListExcel(photoShotVo, model);

        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));

    }

    @PostMapping("/knowhow/list")
    public String knowhowList(PhotoShotVo photoShotVo) {
        photoShotVo.setEvent_idx(EventCode.노하우.getEventIdx());
        String result = con_EventService.selectPhotoShotList(photoShotVo);
        return result;
    }

    @PostMapping("/knowhow/detail")
    public String knowhowDetail(PhotoShotVo photoShotVo) {
        photoShotVo.setEvent_idx(EventCode.노하우.getEventIdx());
        String result = con_EventService.selectPhotoShotDetail(photoShotVo);
        return result;
    }

    @PostMapping("/knowhow/delete")
    public String knowhowDelete(PhotoShotVo photoShotVo) {
        photoShotVo.setEvent_idx(EventCode.노하우.getEventIdx());
        String result = con_EventService.deletePhotoShot(photoShotVo);
        return result;
    }

    @PostMapping("/knowhow/good")
    public String knowhowGood(PhotoShotVo photoShotVo) {
        photoShotVo.setEvent_idx(EventCode.노하우.getEventIdx());
        String result = con_EventService.updatePhotoGood(photoShotVo);
        return result;
    }

    @PostMapping("/knowhow/excel")
    public String knowhowExcel(HttpServletRequest request, HttpServletResponse response, Model model, PhotoShotVo photoShotVo) throws GlobalException {

        Model resultModel = con_EventService.getKnowhowListExcel(photoShotVo, model);

        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));

    }

    @PostMapping("/member/list")
    public String selectEventMemberList(EventMemberVo eventMemberVo){
        eventMemberVo.setEvent_idx(EventCode.방송장비.getEventIdx());
        String result = con_EventService.selectEventMemberList(eventMemberVo);
        return result;
    }

    @PostMapping("/member/list/excel")
    public String memberListExcel(HttpServletRequest request, HttpServletResponse response, Model model, EventMemberVo eventMemberVo) throws GlobalException {

        Model resultModel = con_EventService.getEventMemberListExcel(eventMemberVo, model);

        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));

    }

    /*======================= 이벤트 관리 =======================*/

    /**
     * 이벤트 리스트 조회
     */
    @PostMapping("/management/list")
    public String eventManagementList(P_EventManagementListInputVo pEventManagementListInputVo) {
        String result = con_EventService.callEventManagementList(pEventManagementListInputVo);
        return result;
    }

    /**
     * 이벤트 상세 정보
     */
    @PostMapping("/management/info")
    public String eventManagementInfo(P_EventManagementEventIdxInputVo pEventManagementEventIdxInputVo) {
        String result = con_EventService.callEventManagementInfo(pEventManagementEventIdxInputVo);
        return result;
    }

    /**
     * 이벤트 등록
     */
    @PostMapping("/management/add")
    public String eventManagementAdd(P_EventManagementAddVo pEventManagementAddVo) {
        String result = con_EventService.callEventManagementAdd(pEventManagementAddVo);
        return result;
    }

    /**
     * 이벤트 수정
     */
    @PostMapping("/management/edit")
    public String eventManagementEdit(P_EventManagementEditVo pEventManagementEditVo) {
        String result = con_EventService.callEventManagementEdit(pEventManagementEditVo);
        return result;
    }

    /**
     * 이벤트 삭제
     */
    @PostMapping("/management/delete")
    public String eventManagementDelete(P_EventManagementDeleteVo pEventManagementDeleteVo) {
        String result = con_EventService.callEventManagementDelete(pEventManagementDeleteVo);
        return result;
    }

    /**
     * 경품 리스트 조회
     */
    @PostMapping("/management/prize/list")
    public String eventPrizeList(P_EventManagementEventIdxInputVo pEventManagementEventIdxInputVo) {
        String result = con_EventService.callEventPrizeList(pEventManagementEventIdxInputVo);
        return result;
    }

    /**
     * 경품 등록
     */
    @PostMapping("/management/prize/add")
    public String eventPrizeAdd(P_EventPrizeAddVo pEventPrizeAddVo) {
        String result = con_EventService.callEventPrizeAdd(pEventPrizeAddVo);
        return result;
    }

    /**
     * 경품 상세 조회
     */
    @PostMapping("/management/prize/detail")
    public String eventPrizeDetail(P_EventPrizeDetailInputVo pEventPrizeDetailInputVo) {
        String result = con_EventService.callEventPrizeDetail(pEventPrizeDetailInputVo);
        return result;
    }

    /**
     * 경품 수정
     */
    @PostMapping("/management/prize/edit")
    public String eventPrizeEdit(P_EventPrizeEditVo pEventPrizeEditVo) {
        String result = con_EventService.callEventPrizeEdit(pEventPrizeEditVo);
        return result;
    }

    /**
     * 경품 삭제
     */
    @PostMapping("/management/prize/delete")
    public String eventPrizeDelete(P_EventPrizeDeleteVo pEventPrizeDeleteVo) {
        String result = con_EventService.callEventPrizeDelete(pEventPrizeDeleteVo);
        return result;
    }

    /**
     * 응모자/당첨자 정보
     */
    @PostMapping("/management/winner/info")
    public String eventWinnerInfo(P_EventManagementEventIdxInputVo pEventManagementEventIdxInputVo) {
        String result = con_EventService.callEventWinnerInfo(pEventManagementEventIdxInputVo);
        return result;
    }

    /**
     * 응모자/당첨자 리스트 조회
     */
    @PostMapping("/management/winner/applicant")
    public String eventWinnerApplicant(P_EventWinnerApplicantInputVo pEventWinnerApplicantInputVo) {
        String result = con_EventService.callEventWinnerApplicant(pEventWinnerApplicantInputVo);
        return result;
    }

    /**
     * 응모자/당첨자 리스트 엑셀
     */
    @PostMapping("/management/winner/listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model, P_EventWinnerApplicantInputVo pEventWinnerApplicantInputVo) throws GlobalException {

        Model resultModel = con_EventService.getListExcel(pEventWinnerApplicantInputVo, model);

        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    /**
     * 당첨자 리스트 조회
     */
    @PostMapping("/management/winner/list")
    public String eventWinnerList(P_EventManagementEventIdxInputVo pEventManagementEventIdxInputVo) {
        String result = con_EventService.callEventWinnerList(pEventManagementEventIdxInputVo);
        return result;
    }

    /**
     * 당첨자 추가 입력 정보 조회
     */
    @PostMapping("/management/winner/winnerAddInfoDetail")
    public String eventWinnerAddInfoDetail(EventWinnerAddInfoDetailVo eventWinnerAddInfoDetailVo) {
        String result = con_EventService.selectEventWinnerAddInfoDetail(eventWinnerAddInfoDetailVo);
        return result;
    }

    /**
     * 당첨자 추가
     */
    @PostMapping("/management/winner/add")
    public String eventWinnerAdd(P_EventWinnerAddVo pEventWinnerAddVo) {
        String result = con_EventService.callEventWinnerAdd(pEventWinnerAddVo);
        return result;
    }

    /**
     * 당첨자 취소
     */
    @PostMapping("/management/winner/delete")
    public String eventWinnerDelete(P_EventWinnerDeleteVo pEventWinnerDeleteVo) {
        String result = con_EventService.callEventWinnerDelete(pEventWinnerDeleteVo);
        return result;
    }

    /**
     * 당첨자 선정 완료 / 재선정
     */
    @PostMapping("/management/winner/complete")
    public String eventWinnerComplete(P_EventWinnerCompleteVo pEventWinnerCompleteVo) {
        String result = con_EventService.callEventWinnerComplete(pEventWinnerCompleteVo);
        return result;
    }

    /**
     * 당첨자 상태 변경
     */
    @PostMapping("/management/winner/update")
    public String eventWinnerUpdate(P_EventWinnerUpdateVo pEventWinnerUpdateVo) {
        String result = con_EventService.callEventWinnerUpdate(pEventWinnerUpdateVo);
        return result;
    }

    /**
     * 당첨자 발표 가져오기
     */
    @PostMapping("/management/announcement/info")
    public String eventAnnouncementInfo(P_EventManagementEventIdxInputVo pEventManagementEventIdxInputVo) {
        String result = con_EventService.callEventAnnouncementInfo(pEventManagementEventIdxInputVo);
        return result;
    }

    /**
     * 당첨자 발표 등록/수정
     */
    @PostMapping("/management/announcement/edit")
    public String eventAnnouncementEdit(P_EventAnnouncementEditVo pEventAnnouncementEditVo) {
        String result = con_EventService.callEventAnnouncementEdit(pEventAnnouncementEditVo);
        return result;
    }

    /*======================= 기존 이벤트 관리 ======================= */
//    /**
//     * 이벤트 목록
//     */
//    @PostMapping("list")
//    public String list(P_EventListInputVo pEventListInputVo){
//        String result = con_EventService.getEventList(pEventListInputVo);
//        return result;
//    }
//
//    /**
//     * 이벤트 삭제
//     */
//    @PostMapping("eventDelete")
//    public String eventDelete(P_EventDeleteVo pEventDeleteVo){
//        String result = con_EventService.setEventDelete(pEventDeleteVo);
//        return result;
//    }
//
//    /**
//     * 이벤트 등록
//     */
//    @PostMapping("eventInsert")
//    public String eventInsert(P_EventUpdateVo pEventUpdateVo){
//        String result = con_EventService.setEventInsert(pEventUpdateVo);
//        return result;
//    }
//
//    /**
//     * 이벤트 수정
//     */
//    @PostMapping("eventUpdate")
//    public String eventUpdate(P_EventUpdateVo pEventUpdateVo){
//        String result = con_EventService.setEventUpdate(pEventUpdateVo);
//        return result;
//    }
//
//    /**
//     * 이벤트 응모자 목록
//     */
//    @PostMapping("memberList")
//    public String memberList(P_EventMemberListInputVo pEventMemberListInputVo){
//        String result = con_EventService.getEventMemberList(pEventMemberListInputVo);
//        return result;
//    }
//
//    /**
//     * 이벤트 선택당첨
//     */
//    @PostMapping("memberSelWin")
//    public String memberSelWin(P_EventMemberSelWinVo pEventMemberSelWinVo){
//        String result="";
//        if(pEventMemberSelWinVo.getChoiceNum() != 0) {
//            result = con_EventService.getEventMemberSelWin(pEventMemberSelWinVo);
//        }
//        return result;
//    }
//
//    /**
//     * 이벤트 중복 응모자 목록
//     */
//    @PostMapping("overlapApplyList")
//    public String overlapApplyList(P_EventMemberListInputVo pEventMemberListInputVo){
//        String result = con_EventService.getEventOverlapApplyList(pEventMemberListInputVo);
//        return result;
//    }
//
//
//    /**
//     * 이벤트 댓글 리스트 조회
//     */
//    @PostMapping("/reply")
//    public String replyList(P_EventReplyListInputVo pEventReplyListInputVo) {
//        String result = con_EventService.getEventReplyList(pEventReplyListInputVo);
//        return result;
//    }
//
//
//    /**
//     * 이벤트 댓글 삭제
//     */
//    @PostMapping("/reply/delete")
//    public String replyDelete(P_EventReplyDeleteInputVo pEventReplyDeleteInputVo) {
//        String result = con_EventService.getEventReplyDelete(pEventReplyDeleteInputVo);
//        return result;
//    }
}
