package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_DjFanCouponVo extends PagingVo {
    private String memNo; // 회원번호
    private String chrgrMemName; // 관리자 이름
    private int couponSlct; // 1:지급, 2:차감
    private int procCnt; // 처리수

    private int s_return; // 결과 값 (-1: 부족, 0:에러, 1: 성공)
    private int s_afterCnt; // 처리 후 응모권 개수
}
