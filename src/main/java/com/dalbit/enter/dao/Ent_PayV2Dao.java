package com.dalbit.enter.dao;

import com.dalbit.enter.vo.procedure.P_PaymentDayPaycodeOutputVo;
import com.dalbit.enter.vo.procedure.P_PaymentDayPaysexOutputVo;
import com.dalbit.enter.vo.procedure.P_PaymentDayPaywayOutputVo;
import com.dalbit.enter.vo.procedure.P_PaymentSearchInputVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Ent_PayV2Dao {
    /**
     * 결제현황 시간대별
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    List<Object> selectPaymentTimeList(P_PaymentSearchInputVo pPaymentSearchInputVo);

    /**
     * 결제현황 일간대별
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    List<Object> selectPaymentDayList(P_PaymentSearchInputVo pPaymentSearchInputVo);

    /**
     * 결제현황 월간/결제수단별
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    List<Object> selectPaymentMonthList(P_PaymentSearchInputVo pPaymentSearchInputVo);

    /**
     * 결제현황 연간결제
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    List<Object> selectPaymentYearList(P_PaymentSearchInputVo pPaymentSearchInputVo);

    /**
     * 결제 취소
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    List<Object> selectPaymentCancelMemberList(P_PaymentSearchInputVo pPaymentSearchInputVo);

    /**
     * 결제 성공
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    List<Object> selectPaymentSuccMemberList(P_PaymentSearchInputVo pPaymentSearchInputVo);

    /**
     * 결제현황 결제 회원별
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    List<P_PaymentDayPaysexOutputVo> selectPaymentMonthMemberStat(P_PaymentSearchInputVo pPaymentSearchInputVo);

    /**
     * 결제현황 결제 수단별
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    List<P_PaymentDayPaywayOutputVo> selectPaymentMonthPaywayStat(P_PaymentSearchInputVo pPaymentSearchInputVo);

    /**
     * 결제현황 결제 상품별
     *
     * @param pPaymentSearchInputVo
     * @return
     */
    List<P_PaymentDayPaycodeOutputVo> selectPaymentMonthPaycodeStat(P_PaymentSearchInputVo pPaymentSearchInputVo);
}
