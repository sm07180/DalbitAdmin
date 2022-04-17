package com.dalbit.enter.service;


import com.dalbit.enter.dao.Ent_PayV2Dao;
import com.dalbit.enter.vo.procedure.P_PaymentSearchInputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class Ent_PayV2Service {

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Ent_PayV2Dao ent_payV2Dao;

    @Autowired
    ExcelService excelService;

    /**
     * 결제현황 시간대별
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payTime(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제현황 일간대별
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payDay(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제현황 월간
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payMonth(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제현황  연간
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payYear(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제시도 내역
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payTry(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제성공 내역
     * @param pPaymentSearchInputVo
     * @return
     */
    public String paySucc(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제실패 내역
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payFail(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제취소 내역
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payCancel(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제현황 월간 - 성별
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payMonthByPaySex(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제현황 월간 - 결제수단
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payMonthByPayWay(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제현황 월간 - 결제상품
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payMonthByPayCode(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }
}
