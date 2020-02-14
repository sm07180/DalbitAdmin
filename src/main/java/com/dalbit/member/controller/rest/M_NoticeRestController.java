package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.member.service.M_NoticeService;
import com.dalbit.member.vo.NoticeListVo;
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
@RequestMapping("rest/member/notice")
public class M_NoticeRestController {

    @Autowired
    M_NoticeService mNoticeService;

    @Autowired
    GsonUtil gsonUtil;


    /**
     * 회원리스트
     * //@param model
     * @return
     */

    @PostMapping("list")
    public String list(HttpServletRequest request) {
        NoticeListVo apiData = new NoticeListVo();
        apiData.setMemNo((String) request.getParameter("mem_no"));
        List<NoticeListVo> list = mNoticeService.getBroadNoticeList(apiData);
        return gsonUtil.toJson(new JsonOutputVo(Status.MyStar목록보기성공, list));
    }




}
