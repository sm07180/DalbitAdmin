package com.dalbit.content.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/content/event")
public class Con_EventController {

    @GetMapping("/management/list")
    public String list() {
        return "content/event/management/list";
    }

    @GetMapping("attendance/list")
    public String attendanceList() {
        return "content/event/attendance/list";
    }

    @GetMapping("attendance/calendar")
    public String attendanceCalendar() {
        return "content/event/attendance/calendar";
    }

    @GetMapping("attendance/bonusList")
    public String attendanceBonusList() {
        return "content/event/attendance/bonusList";
    }

    @GetMapping("attendance/giftconList")
    public String attendanceGiftconList() {
        return "content/event/attendance/giftconList";
    }

    @GetMapping("photo/shot/list")
    public String photoShotList(){
        return "content/event/shot/list";
    }

    @GetMapping("knowhow/list")
    public String knowhowList(){
        return "content/event/knowhow/list";
    }

    @GetMapping("member/list")
    public String memberList(){
        return "content/event/member/list";
    }
}
