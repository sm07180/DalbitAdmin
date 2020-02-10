package com.dalbit.member.controller.rest;


import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.member.service.M_ListenService;
import com.dalbit.member.vo.ListenListVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.common.code.Status;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/member/listen")
public class M_ListenRestController {

    @Autowired
    M_ListenService mListenService;

    @Autowired
    GsonUtil gsonUtil;

   @PostMapping("list")
    public String list() {
       List<ListenListVo> listenListVo = mListenService.getListenList();
       return gsonUtil.toJson(new JsonOutputVo(Status.조회, listenListVo));
   }
}
