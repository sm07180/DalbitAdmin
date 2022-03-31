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

    /* 법정대리인 동의 철회 (결제) */
    // s_return	INT		-- -1:삭제 데이터 없음, 0:에러, 1:정상
    @Select("CALL rd_data.p_mem_parents_auth_del(#{memNo})")
    Integer parentsAuthDel(String memNo);

    /* 법정대리인 동의 복귀 (결제) */
    // -1:데이터 없음, 0:에러, 1:정상
    @Select("CALL rd_data.p_adm_mem_parents_auth_recovory(#{memNo})")
    Integer parentsAuthRecovery(String memNo);

}
