package com.dalbit.member.proc;

import com.dalbit.member.vo.procedure.P_RouletteCouponVo;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public interface P_Member {
    /* 관리자 룰렛 응모권 지급/차감 등록 */
    @Select("CALL rd_admin.p_adm_event_coupon_ins(#{memNo}, #{chrgrMemName}, #{couponSlct}, #{procCnt})")
    P_RouletteCouponVo insEventCouponIns(P_RouletteCouponVo pRouletteCouponVo);

}
