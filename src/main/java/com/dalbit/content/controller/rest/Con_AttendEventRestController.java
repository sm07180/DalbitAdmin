package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_AttendEventService;
import com.dalbit.content.vo.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/content/event")
public class Con_AttendEventRestController {

    @Autowired
    ExcelService excelService;

    @Autowired
    Con_AttendEventService con_attendEventService;

    @Autowired
    GsonUtil gsonUtil;


    /*======================= 출석 체크 이벤트 ======================= */

    /**
     * 출석 이벤트 리스트 조회
     */
    @PostMapping("/attendance/list")
    public String attendanceList(AttendanceVo attendanceVo) {
        String result = con_attendEventService.selectAttendanceList(attendanceVo);
        return result;
    }

    @PostMapping("/attendance/calendar/list")
    public String attendanceCalendarList(AttendanceCalendarVo attendanceCalendarVo) {
        String result = con_attendEventService.selectAttendanceCalendarList(attendanceCalendarVo);
        return result;
    }

    @PostMapping("/attendance/calendar/week")
    public String attendanceCalendarWeek(AttendanceCalendarVo attendanceCalendarVo) {
        String result = con_attendEventService.selectAttendanceWeekCalendarList(attendanceCalendarVo);
        return result;
    }

    @PostMapping("/attendance/bonus/status")
    public String selectAttendanceBonus(AttendanceBonusVo attendanceBonusVo) {
        String result = con_attendEventService.selectAttendanceBonus(attendanceBonusVo);
        return result;
    }

    @PostMapping("/attendance/giftconList")
    public String giftconList(AttendanceGiftconVo attendanceGiftconVo) {
        String result = con_attendEventService.selectGiftconList(attendanceGiftconVo);
        return result;
    }
}