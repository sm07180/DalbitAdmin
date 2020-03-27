package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.CodeVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.service.ThemeService;
import com.dalbit.content.vo.ThemeVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/content/theme")
public class ThemeRestController {

    @Autowired
    ThemeService service;

    @Autowired
    CommonService commonService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("broadcast")
    public String broadcastList(HttpServletRequest request, ThemeVo splashVo) {
        List<CodeVo> roomTypeList = commonService.getCodeList("roomType");

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, roomTypeList));
    }


    @PostMapping("cast")
    public String castList(HttpServletRequest request, ThemeVo splashVo) {
        List<CodeVo> roomTypeList = commonService.getCodeList("roomType");

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, roomTypeList));
    }
}
