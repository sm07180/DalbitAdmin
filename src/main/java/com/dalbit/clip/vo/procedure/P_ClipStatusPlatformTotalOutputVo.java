package com.dalbit.clip.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ClipStatusPlatformTotalOutputVo extends BaseVo {
    private int sum_reg_and_cnt;		// 안드로이드 등록 합계
    private int sum_del_and_cnt;		// 안드로이드 삭제 합계
    private int sum_reg_ios_cnt;		// 아이폰 등록 합계
    private int sum_del_ios_cnt;		// 아이폰 삭제 합계
    private int sum_reg_pc_cnt;		// 피씨 등록 합계
    private int sum_del_pc_cnt;		// 피씨 삭제 합계
    private int sum_listen_and_cnt;		// 안드로이드 청취자수
    private int sum_listen_ios_cnt;		// 아이폰 청취자수
    private int sum_listen_pc_cnt;		// 피씨 청취자수

    private int sum_reg_total_cnt;		// 총 등록 합계
    private int sum_del_total_cnt;		// 총 삭제 합계
    private int sum_listen_total_cnt;		// 총 청취자수
}
