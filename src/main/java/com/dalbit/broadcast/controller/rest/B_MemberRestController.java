package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.B_MemberService;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/member")
public class B_MemberRestController {

    @Autowired
    B_MemberService bMemberService;

    @Autowired
    GsonUtil gsonUtil;

}
