package com.dalbit.member.proc;

import com.dalbit.member.vo.procedure.P_DjFanCouponVo;
import com.dalbit.member.vo.procedure.P_RouletteCouponVo;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface P_Member {
    /* 관리자 룰렛 응모권 지급/차감 등록 */
    @Select("CALL rd_admin.p_adm_event_coupon_ins(#{memNo}, #{chrgrMemName}, #{couponSlct}, #{procCnt})")
    P_RouletteCouponVo insEventCouponIns(P_RouletteCouponVo pRouletteCouponVo);

    /* 관리자 11월 경품 응모권 지급/차감 등록 */
    @Select("CALL rd_admin.p_adm_event_november_dal_upd(#{memNo}, #{couponSlct}, #{procCnt}, #{chrgrMemName})")
    P_DjFanCouponVo insDjFanEventCouponIns(P_DjFanCouponVo pDjFanCouponVo);

    /* 관리자 11월 경품 응모권 지급/차감 내역 */
    @Select("CALL rd_admin.p_adm_event_november_dal_log_list(#{memNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> getDjFanEventCouponHistory(P_DjFanCouponVo pDjFanCouponVo);


}
