package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.B_BroadcastService;
import com.dalbit.broadcast.service.B_MemberService;
import com.dalbit.broadcast.vo.BroadcastHistroyVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/member")
public class B_MemberRestController {

    @Autowired
    B_MemberService bMemberService;

    @Autowired
    GsonUtil gsonUtil;

}
