package com.dalbit.enter.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.enter.dao.Ent_PayV2Dao;
import com.dalbit.enter.vo.procedure.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

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
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payTime(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        List<Object> getList = ent_payV2Dao.selectPaymentTimeList(pPaymentSearchInputVo);
        List<P_PaymentTimeStateOutputVo> list = DBUtil.getList(getList, P_PaymentTimeStateOutputVo.class);
        P_PaymentTimeAvgStateOutputVo pPaymentTimeAvgStateOutputVo = DBUtil.getData(getList, P_PaymentTimeAvgStateOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("listData", list);
        resHashMap.put("avgState", pPaymentTimeAvgStateOutputVo);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 결제현황 일간대별
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payDay(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        List<Object> getData = ent_payV2Dao.selectPaymentDayList(pPaymentSearchInputVo);
        P_PaymentDayPaywayOutputVo payway = DBUtil.getData(getData, P_PaymentDayPaywayOutputVo.class);
        P_PaymentDayPaysexOutputVo paysex = DBUtil.getData(getData, P_PaymentDayPaysexOutputVo.class);
        P_PaymentDayPaycodeOutputVo paycode = DBUtil.getData(getData, P_PaymentDayPaycodeOutputVo.class);

        HashMap resHashMap2 = new HashMap();
        resHashMap2.put("info", paycode);
        resHashMap2.put("info2", paysex);
        resHashMap2.put("info3", payway);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("data", resHashMap2);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 결제현황 월간
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payMonth(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        List<Object> getList = ent_payV2Dao.selectPaymentMonthList(pPaymentSearchInputVo);
        List<P_PaymentMonthStateOutputVo> list = DBUtil.getList(getList, P_PaymentMonthStateOutputVo.class);
        P_PaymentMonthAvgStateOutputVo pPaymentMonthAvgStateOutputVo = DBUtil.getData(getList, P_PaymentMonthAvgStateOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("listData", list);
        resHashMap.put("avgState", pPaymentMonthAvgStateOutputVo);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 결제현황  연간
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payYear(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        List<Object> getList = ent_payV2Dao.selectPaymentYearList(pPaymentSearchInputVo);
        List<P_PaymentYearStateOutputVo> stateList = DBUtil.getList(getList, P_PaymentYearStateOutputVo.class);
        P_PaymentYearTotalStateOutputVo pPaymentYearTotalStateOutputVo = DBUtil.getData(getList, P_PaymentYearTotalStateOutputVo.class);
        List<P_PaymentYearPaywayStateOutputVo> paywayList = DBUtil.getList(getList, P_PaymentYearPaywayStateOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("stateList", stateList);
        resHashMap.put("state", pPaymentYearTotalStateOutputVo);
        resHashMap.put("paywayList", paywayList);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 결제시도 내역
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payTry(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제성공 내역
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    public String paySucc(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        List<Object> getList = ent_payV2Dao.selectPaymentSuccMemberList(pPaymentSearchInputVo);
        P_PaymentTotalOutputVo pPaymentTotalOutputVo = DBUtil.getData(getList, P_PaymentTotalOutputVo.class);
        List<P_PaymentMemberListOutputVo> list = DBUtil.getList(getList, P_PaymentMemberListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", pPaymentTotalOutputVo.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 결제실패 내역
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payFail(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        return "{}";
    }

    /**
     * 결제취소 내역
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payCancel(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        List<Object> getList = ent_payV2Dao.selectPaymentCancelMemberList(pPaymentSearchInputVo);
        P_PaymentTotalOutputVo pPaymentTotalOutputVo = DBUtil.getData(getList, P_PaymentTotalOutputVo.class);
        List<P_PaymentMemberListOutputVo> list = DBUtil.getList(getList, P_PaymentMemberListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", pPaymentTotalOutputVo.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 결제현황 월간 - 성별
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payMonthByPaySex(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        List<P_PaymentDayPaysexOutputVo> getData = ent_payV2Dao.selectPaymentMonthMemberStat(pPaymentSearchInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("data", getData);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 결제현황 월간 - 결제수단
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payMonthByPayWay(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        List<P_PaymentDayPaywayOutputVo> getData = ent_payV2Dao.selectPaymentMonthPaywayStat(pPaymentSearchInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("data", getData);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 결제현황 월간 - 결제상품
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    public String payMonthByPayCode(P_PaymentSearchInputVo pPaymentSearchInputVo) {
        List<P_PaymentDayPaycodeOutputVo> getData = ent_payV2Dao.selectPaymentMonthPaycodeStat(pPaymentSearchInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("data", getData);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }
}
