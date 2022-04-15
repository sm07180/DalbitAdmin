package com.dalbit.enter.controller.rest;

import com.dalbit.enter.service.Ent_PayV2Service;
import com.dalbit.enter.vo.procedure.P_PayTotalInPutVo;
import com.dalbit.enter.vo.procedure.P_StatVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/v2/rest/enter/pay")
public class Ent_PayRestV2Controller {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    Ent_PayV2Service ent_payV2Service;

    @Autowired
    ExcelService excelService;

    @PostMapping("time")
    public String payTime() {
        return "";
    }

    @PostMapping("day")
    public String payDay() {
        return "";
    }

    @PostMapping("month")
    public String payMonth() {
        return "";
    }

    @PostMapping("year")
    public String payYear() {
        return "";
    }

    @PostMapping("try")
    public String payTry() {
        return "";
    }

    @PostMapping("succ")
    public String paySucc() {
        return "";
    }

    @PostMapping("fail")
    public String payFail() {
        return "";
    }

    @PostMapping("cancel")
    public String payCancel() {
        return "";
    }

    @PostMapping("month/paysex")
    public String payMonthByPaySex() {
        return "";
    }

    @PostMapping("month/payway")
    public String payMonthByPayWay() {
        return "";
    }

    @PostMapping("month/paycode")
    public String payMonthByPayCode() {
        return "";
    }
}
