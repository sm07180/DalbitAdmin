package com.dalbit.content.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/content/notice")
public class NoticeController {

    @GetMapping("/list")
    public String list() {
        return "content/notice/list";
    }

    @GetMapping("/noticeDetail")
    public String noteDetail() {
        return "content/notice/noticeDetail";
    }

    @GetMapping("/noticeEdit")
    public String noticeEdit() {
        return "content/notice/noticeEdit";
    }

}
