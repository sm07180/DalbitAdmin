package com.dalbit.content.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/content/event")
public class Con_EventController {

    @GetMapping("/list")
    public String list() {
        return "content/event/list";
    }

    @GetMapping("attendance/list")
    public String attendanceList() {
        return "content/event/attendance/list";
    }

    @GetMapping("attendance/calendar")
    public String attendanceCalendar() {
        return "content/event/attendance/calendar";
    }
}
