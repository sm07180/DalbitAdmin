package com.dalbit.enter.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.enter.service.Ent_PayV2Service;
import com.dalbit.enter.vo.procedure.P_PaymentSearchInputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@RestController
@RequestMapping("v2/rest/enter/pay")
public class Ent_PayRestV2Controller {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    Ent_PayV2Service ent_payV2Service;

    @Autowired
    ExcelService excelService;

    /**
     * 결제현황 시간대별
     * @param pPaymentSearchInputVo
     * @return
     */
    @PostMapping("time")
    public String payTime(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return ent_payV2Service.payTime(pPaymentSearchInputVo);
    }

    /**
     * 결제현황 일간대별
     * @param pPaymentSearchInputVo
     * @return
     */
    @PostMapping("day")
    public String payDay(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return ent_payV2Service.payDay(pPaymentSearchInputVo);
    }

    /**
     * 결제현황 월간 - 수단별
     * @param pPaymentSearchInputVo
     * @return
     */
    @PostMapping("month")
    public String payMonth(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return ent_payV2Service.payMonth(pPaymentSearchInputVo);
    }

    /**
     * 결제현황  연간
     * @param pPaymentSearchInputVo
     * @return
     */
    @PostMapping("year")
    public String payYear(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return ent_payV2Service.payYear(pPaymentSearchInputVo);
    }

    /**
     * 결제시도 내역
     * @param pPaymentSearchInputVo
     * @return
     */
    @PostMapping("try")
    public String payTry(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return ent_payV2Service.payTry(pPaymentSearchInputVo);
    }

    /**
     * 결제성공 내역
     * @param pPaymentSearchInputVo
     * @return
     */
    @PostMapping("succ")
    public String paySucc(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return ent_payV2Service.paySucc(pPaymentSearchInputVo);
    }

    @PostMapping("succ/excel")
    public String paySuccExcel(HttpServletRequest request, HttpServletResponse response, Model model, P_PaymentSearchInputVo pPaymentSearchInputVo) throws GlobalException {
        Model resultModel = ent_payV2Service.paySuccExcel(pPaymentSearchInputVo, model);
        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    /**
     * 결제실패 내역
     * @param pPaymentSearchInputVo
     * @return
     */
    @PostMapping("fail")
    public String payFail(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return ent_payV2Service.payFail(pPaymentSearchInputVo);
    }

    /**
     * 결제취소 내역
     * @param pPaymentSearchInputVo
     * @return
     */
    @PostMapping("cancel")
    public String payCancel(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return ent_payV2Service.payCancel(pPaymentSearchInputVo);
    }

    @PostMapping("cancel/excel")
    public String payCancelExcel(HttpServletRequest request, HttpServletResponse response, Model model, P_PaymentSearchInputVo pPaymentSearchInputVo) throws GlobalException {
        Model resultModel = ent_payV2Service.payCancelExcel(pPaymentSearchInputVo, model);
        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    /**
     * 결제현황 월간 - 성별
     * @param pPaymentSearchInputVo
     * @return
     */
    @PostMapping("month/paysex")
    public String payMonthByPaySex(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return ent_payV2Service.payMonthByPaySex(pPaymentSearchInputVo);
    }

    /**
     * 결제현황 월간 - 결제수단
     * @param pPaymentSearchInputVo
     * @return
     */
    @PostMapping("month/payway")
    public String payMonthByPayWay(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return ent_payV2Service.payMonthByPayWay(pPaymentSearchInputVo);
    }

    /**
     * 결제현황 월간 - 결제상품
     * @param pPaymentSearchInputVo
     * @return
     */
    @PostMapping("month/paycode")
    public String payMonthByPayCode(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return ent_payV2Service.payMonthByPayCode(pPaymentSearchInputVo);
    }
}
