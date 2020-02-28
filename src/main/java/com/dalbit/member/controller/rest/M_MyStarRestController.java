package com.dalbit.member.controller.rest;


import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.code.Status;
import com.dalbit.member.service.M_MyStarService;
import com.dalbit.member.vo.MyStarListVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/member/myStar")
public class M_MyStarRestController {

    @Autowired
    M_MyStarService mMyStarService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("list")
    public String list(MyStarListVo myStarListVo) {
        List<MyStarListVo> list = mMyStarService.getMyStarList(myStarListVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.MyStar목록보기성공, list));
    }
}
