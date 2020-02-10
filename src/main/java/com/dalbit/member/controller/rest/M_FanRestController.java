package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.member.service.M_FanService;
import com.dalbit.member.vo.FanListVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/member/fan")
public class M_FanRestController {

    @Autowired
    M_FanService mFanService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("list")
    public String list() {
        List<FanListVo> fanListVo = mFanService.getFanList();
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, fanListVo));
    }




}
