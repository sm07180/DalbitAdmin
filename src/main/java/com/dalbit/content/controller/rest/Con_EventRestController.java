package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_EventService;
import com.dalbit.content.vo.AttendanceVo;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/content/event")
public class Con_EventRestController {

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

}
