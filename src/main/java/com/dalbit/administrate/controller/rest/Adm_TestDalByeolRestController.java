package com.dalbit.administrate.controller.rest;

import com.dalbit.administrate.service.Adm_TestDalByeolService;
import com.dalbit.administrate.service.Adm_TestIdService;
import com.dalbit.administrate.vo.AdminIdVo;
import com.dalbit.administrate.vo.TestIdListVo;
import com.dalbit.administrate.vo.TestIdVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.security.vo.InforexLoginUserInfoVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/rest/administrate/testDalByeol")
public class Adm_TestDalByeolRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    CommonService commonService;
    @Autowired
    Adm_TestDalByeolService adm_TestDalByeolService;

    @Autowired
    ExcelService excelService;

    @PostMapping("/list")
    public String list(TestIdVo testIdVo) {
        String testIdList = adm_TestDalByeolService.getTestDalByeolList(testIdVo);
        return testIdList;
    }


    @PostMapping("/dal/send/list")
    public String dalSendList(TestIdVo testIdVo) {
        String testIdList = adm_TestDalByeolService.getDalSendList(testIdVo);
        return testIdList;
    }

    @PostMapping("/byeol/send/list")
    public String byeolSendList(TestIdVo testIdVo) {
        String testIdList = adm_TestDalByeolService.getByeolSendList(testIdVo);
        return testIdList;
    }
}
