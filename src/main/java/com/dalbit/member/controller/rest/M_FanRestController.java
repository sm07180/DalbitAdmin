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

import javax.servlet.http.HttpServletRequest;
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
    public String list(HttpServletRequest request) {
        FanListVo apiData = new FanListVo();
        apiData.setMemNo((String) request.getParameter("mem_no"));
        List<FanListVo> list = mFanService.getFanList(apiData);
        return gsonUtil.toJson(new JsonOutputVo(Status.MyStar목록보기성공, list));
    }
}
