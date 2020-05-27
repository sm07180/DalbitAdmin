package com.dalbit.money.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.money.service.Mon_ExchangeService;
import com.dalbit.money.vo.Mon_ExchangeInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@RestController
@RequestMapping("rest/money/exchange")
public class Mon_ExchangeRestController {

    @Autowired
    Mon_ExchangeService monExchangeService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("list")
    public String list(Mon_ExchangeInputVo monExchangeInputVo) throws GlobalException {
        String result = monExchangeService.selectExchangeList(monExchangeInputVo);
        return result;
    }

    @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Mon_ExchangeInputVo monExchangeInputVo, Model model) throws GlobalException {
        Model resultModel = monExchangeService.getListExcel(monExchangeInputVo, model);

        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    @PostMapping("summary")
    public String summary(Mon_ExchangeInputVo monExchangeInputVo) throws GlobalException {
        String result = monExchangeService.selectExchangeSummary(monExchangeInputVo);
        return result;
    }
}
