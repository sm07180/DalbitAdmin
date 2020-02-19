package com.dalbit.administrate.controller.rest;

import com.dalbit.administrate.service.A_StarService;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.CodeVo;
import com.dalbit.common.vo.JsonOutputVo;
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
@RequestMapping("rest/administrate/theme")
public class A_ThemeRestController {

    @Autowired
    CommonService commonService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 리스트
     * @return
     */
    @PostMapping("list")
    public String list() {
        List<CodeVo> roomTypeList = commonService.getCodeList("roomType");

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, roomTypeList));
    }


}
