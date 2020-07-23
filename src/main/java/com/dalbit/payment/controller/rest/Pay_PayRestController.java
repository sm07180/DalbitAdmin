package com.dalbit.payment.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.payment.service.Pay_PayService;
import com.dalbit.payment.vo.Pay_CooconReceiptInputVo;
import com.dalbit.payment.vo.Pay_IosAttempInputVo;
import com.dalbit.payment.vo.Pay_PayInputVo;
import com.dalbit.util.GsonUtil;
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
@RequestMapping("/rest/payment/pay")
public class Pay_PayRestController {

    @Autowired
    Pay_PayService payPayService;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    ExcelService excelService;

    /**
     *  결제 목록 조회
     */
    @PostMapping("list")
    public String list(Pay_PayInputVo pay_PayInputVo) {
        String result = payPayService.getPayList(pay_PayInputVo);
        return result;
    }

    /**
     * 결제 엑셀
     */
    @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model, Pay_PayInputVo payPayInputVo) throws GlobalException {

        Model resultModel = payPayService.getListExcel(payPayInputVo, model);
        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);

        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    @PostMapping("iosAttempList")
    public String iosAttempList(Pay_IosAttempInputVo payIosAttempInputVo) {
        String result = payPayService.selectIosAttempList(payIosAttempInputVo);
        return result;
    }


    /**
     * 쿠콘 현금영수증 리스트
     */
    @PostMapping("cooconReceiptList")
    public String cooconReceiptList(Pay_CooconReceiptInputVo payCooconReceiptInputVo) {
        String result = payPayService.selectCooconReceiptList(payCooconReceiptInputVo);
        return result;
    }


    /**
     * 쿠콘 현금영수증 리스트 엑셀 출력
     */
    @PostMapping("receiptListExcel")
    public String receiptListExcel(HttpServletRequest request, HttpServletResponse response, Model model, Pay_CooconReceiptInputVo payCooconReceiptInputVo) throws GlobalException {
        Model resultModel = payPayService.getReceiptListExcel(payCooconReceiptInputVo, model);

        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

}
