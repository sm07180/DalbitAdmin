package com.dalbit.content.controller.rest;

import com.dalbit.common.code.EventCode;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.service.Con_EventService;
import com.dalbit.content.vo.*;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.menu.vo.SpecialReqVo;
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

    /**
     * 이벤트 목록
     */
    @PostMapping("list")
    public String list(P_EventListInputVo pEventListInputVo){
        String result = con_EventService.getEventList(pEventListInputVo);
        return result;
    }

    /**
     * 이벤트 삭제
     */
    @PostMapping("eventDelete")
    public String eventDelete(P_EventDeleteVo pEventDeleteVo){
        String result = con_EventService.setEventDelete(pEventDeleteVo);
        return result;
    }

    /**
     * 이벤트 등록
     */
    @PostMapping("eventInsert")
    public String eventInsert(P_EventUpdateVo pEventUpdateVo){
        String result = con_EventService.setEventInsert(pEventUpdateVo);
        return result;
    }

    /**
     * 이벤트 수정
     */
    @PostMapping("eventUpdate")
    public String eventUpdate(P_EventUpdateVo pEventUpdateVo){
        String result = con_EventService.setEventUpdate(pEventUpdateVo);
        return result;
    }

    /**
     * 이벤트 응모자 목록
     */
    @PostMapping("memberList")
    public String memberList(P_EventMemberListInputVo pEventMemberListInputVo){
        String result = con_EventService.getEventMemberList(pEventMemberListInputVo);
        return result;
    }

    /**
     * 이벤트 선택당첨
     */
    @PostMapping("memberSelWin")
    public String memberSelWin(P_EventMemberSelWinVo pEventMemberSelWinVo){
        String result="";
        if(pEventMemberSelWinVo.getChoiceNum() != 0) {
            result = con_EventService.getEventMemberSelWin(pEventMemberSelWinVo);
        }
        return result;
    }

    /**
     * 이벤트 중복 응모자 목록
     */
    @PostMapping("overlapApplyList")
    public String overlapApplyList(P_EventMemberListInputVo pEventMemberListInputVo){
        String result = con_EventService.getEventOverlapApplyList(pEventMemberListInputVo);
        return result;
    }


    /**
     * 이벤트 댓글 리스트 조회
     */
    @PostMapping("/reply")
    public String replyList(P_EventReplyListInputVo pEventReplyListInputVo) {
        String result = con_EventService.getEventReplyList(pEventReplyListInputVo);
        return result;
    }


    /**
     * 이벤트 댓글 삭제
     */
    @PostMapping("/reply/delete")
    public String replyDelete(P_EventReplyDeleteInputVo pEventReplyDeleteInputVo) {
        String result = con_EventService.getEventReplyDelete(pEventReplyDeleteInputVo);
        return result;
    }

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
        String result = con_EventService.selectPhotoShotList(photoShotVo);
        return result;
    }

    @PostMapping("/photo/shot/delete")
    public String photoShotDelete(PhotoShotVo photoShotVo) {
        String result = con_EventService.deletePhotoShot(photoShotVo);
        log.debug("1111");
        return result;
    }

    @PostMapping("/photo/shot/excel")
    public String photoShotExcel(HttpServletRequest request, HttpServletResponse response, Model model, PhotoShotVo photoShotVo) throws GlobalException {

        Model resultModel = con_EventService.getPhotoListExcel(photoShotVo, model);

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
}
