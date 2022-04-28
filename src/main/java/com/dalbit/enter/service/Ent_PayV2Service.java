package com.dalbit.enter.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.enter.dao.Ent_PayV2Dao;
import com.dalbit.enter.vo.procedure.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.payment.vo.Pay_PayInputVo;
import com.dalbit.payment.vo.Pay_PayOutputVo;
import com.dalbit.util.DBUtil;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

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
        P_PaymentCancelOutputVo paycancel = DBUtil.getData(getData, P_PaymentCancelOutputVo.class);
        P_PaymentDayPaywayOutputVo payway = DBUtil.getData(getData, P_PaymentDayPaywayOutputVo.class);
        P_PaymentDayPaysexOutputVo paysex = DBUtil.getData(getData, P_PaymentDayPaysexOutputVo.class);
        P_PaymentDayPaycodeOutputVo paycode = DBUtil.getData(getData, P_PaymentDayPaycodeOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("paycancel", paycancel);
        resHashMap.put("payway", payway);
        resHashMap.put("paysex", paysex);
        resHashMap.put("paycode", paycode);
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
     * 엑셀다운로드 - 성공이력 (일간)
     * @param pPaymentSearchInputVo
     * @return
     */
    public Model paySuccExcel(P_PaymentSearchInputVo pPaymentSearchInputVo, Model model) {
        List<Object> getList = ent_payV2Dao.selectPaymentSuccMemberList(pPaymentSearchInputVo);
        List<P_PaymentMemberListOutputVo> list = DBUtil.getList(getList, P_PaymentMemberListOutputVo.class);

        String[] headers = {"No", "회원번호", "닉네임","거래번호", "수단", "정보", "시도일시", "완료일시", "결제아이템", "달 수", "결제수량", "금액", "취소 시 차감 달", "보유 달", "직원여부", "플랫폼"};
        int[] headerWidths = {3000, 3000, 3000,3000, 3000, 5000, 5000, 5000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000};

        int index = 0;
        List<Object[]> bodies = new ArrayList<>();
        for (P_PaymentMemberListOutputVo item : list) {
            HashMap hm = new LinkedHashMap();

            String payWay = DalbitUtil.getPayWayConvert(item.getPay_way());     // 결제수단 코드변환
            String platform = DalbitUtil.getPlatformConvert(item.getOs());      // 플랫폼 변환

            hm.put("no", list.size() - index);
            hm.put("col1", DalbitUtil.isEmpty(item.getMem_no()) ? "" : item.getMem_no());
            hm.put("col2", DalbitUtil.isEmpty(item.getMem_nick()) ? "" : item.getMem_nick());            
            hm.put("col3", DalbitUtil.isEmpty(item.getOrder_id()) ? "" : item.getOrder_id());            
            hm.put("col4", DalbitUtil.isEmpty(payWay) ? "" : payWay);
            hm.put("col5", DalbitUtil.isEmpty(item.getPay_info_no()) ? "" : item.getPay_info_no() + " " + (DalbitUtil.isEmpty(item.getPay_info_nm()) ? "" : item.getPay_info_nm()));
            hm.put("col6", DalbitUtil.isEmpty(item.getPay_dt_comein()) ? "" : item.getPay_dt_comein());
            hm.put("col7", DalbitUtil.isEmpty(item.getPay_ok_date()) ? "" : item.getPay_ok_date() + " " + item.getPay_ok_time());
            hm.put("col8", DalbitUtil.isEmpty(item.getPay_code()) ? "" : item.getPay_code());
            hm.put("col9", DalbitUtil.isEmpty(item.getDal_cnt()) ? "" : DalbitUtil.comma(item.getDal_cnt()));
            hm.put("col10", DalbitUtil.isEmpty(item.getItem_amt()) ? "" : item.getItem_amt());
            hm.put("col11", DalbitUtil.isEmpty(item.getPay_amt()) ? "" : item.getPay_amt());
            hm.put("col12", DalbitUtil.isEmpty(item.getDal_cnt()) ? "" : item.getDal_cnt());
            hm.put("col13", DalbitUtil.isEmpty(item.getTot_dal_cnt()) ? "" : item.getTot_dal_cnt());
            hm.put("col14", DalbitUtil.isEmpty(item.getInner()) ? "" : item.getInner() == 1 ? "Y" : "N");
            hm.put("col15", DalbitUtil.isEmpty(platform) ? "" : platform);

            bodies.add(hm.values().toArray());
            index++;
        }

        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "결제성공내역");

        return model;
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

    public Model payCancelExcel(P_PaymentSearchInputVo pPaymentSearchInputVo, Model model) {
        List<Object> getList = ent_payV2Dao.selectPaymentCancelMemberList(pPaymentSearchInputVo);
        List<P_PaymentMemberListOutputVo> list = DBUtil.getList(getList, P_PaymentMemberListOutputVo.class);

        String[] headers = {"No", "회원번호", "닉네임","거래번호", "수단", "정보", "시도일시", "완료일시", "결제아이템", "달 수", "결제수량", "금액", "취소 시 차감 달", "보유 달", "직원여부", "플랫폼", "취소일시", "취소실패사유", "처리자", "결제상태", "취소상태"};
        int[] headerWidths = {3000, 3000, 3000,3000, 3000, 5000, 5000, 5000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000};

        int index = 0;
        List<Object[]> bodies = new ArrayList<>();
        for (P_PaymentMemberListOutputVo item : list) {
            HashMap hm = new LinkedHashMap();

            String payWay = DalbitUtil.getPayWayConvert(item.getPay_way());     // 결제수단 코드변환
            String platform = DalbitUtil.getPlatformConvert(item.getOs());      // 플랫폼 변환

            hm.put("no", list.size() - index);
            hm.put("col1", DalbitUtil.isEmpty(item.getMem_no()) ? "" : item.getMem_no());
            hm.put("col2", DalbitUtil.isEmpty(item.getMem_nick()) ? "" : item.getMem_nick());
            hm.put("col3", DalbitUtil.isEmpty(item.getOrder_id()) ? "" : item.getOrder_id());
            hm.put("col4", DalbitUtil.isEmpty(payWay) ? "" : payWay);
            hm.put("col5", DalbitUtil.isEmpty(item.getPay_info_no()) ? "" : item.getPay_info_no() + " " + (DalbitUtil.isEmpty(item.getPay_info_nm()) ? "" : item.getPay_info_nm()));
            hm.put("col6", DalbitUtil.isEmpty(item.getPay_dt_comein()) ? "" : item.getPay_dt_comein());
            hm.put("col7", DalbitUtil.isEmpty(item.getPay_ok_date()) ? "" : item.getPay_ok_date() + " " + item.getPay_ok_time());
            hm.put("col8", DalbitUtil.isEmpty(item.getPay_code()) ? "" : item.getPay_code());
            hm.put("col9", DalbitUtil.isEmpty(item.getDal_cnt()) ? "" : DalbitUtil.comma(item.getDal_cnt()));
            hm.put("col10", DalbitUtil.isEmpty(item.getItem_amt()) ? "" : item.getItem_amt());
            hm.put("col11", DalbitUtil.isEmpty(item.getPay_amt()) ? "" : item.getPay_amt());
            hm.put("col12", DalbitUtil.isEmpty(item.getDal_cnt()) ? "" : item.getDal_cnt());
            hm.put("col13", DalbitUtil.isEmpty(item.getTot_dal_cnt()) ? "" : item.getTot_dal_cnt());
            hm.put("col14", DalbitUtil.isEmpty(item.getInner()) ? "" : item.getInner() == 1 ? "Y" : "N");
            hm.put("col15", DalbitUtil.isEmpty(platform) ? "" : platform);
            hm.put("col16", DalbitUtil.isEmpty(item.getCancel_dt()) ? "" : item.getCancel_dt());
            hm.put("col17", DalbitUtil.isEmpty(item.getFail_msg()) ? "" : item.getFail_msg());
            hm.put("col18", DalbitUtil.isEmpty(item.getOp_name()) ? "" : item.getOp_name());
            hm.put("col19", DalbitUtil.isEmpty(item.getPay_yn()) ? "" : item.getPay_yn().toUpperCase());
            hm.put("col20", DalbitUtil.isEmpty(item.getCancel_state()) ? "" : item.getCancel_state().toUpperCase());

            bodies.add(hm.values().toArray());
            index++;
        }

        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "결제취소내역");

        return model;
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
