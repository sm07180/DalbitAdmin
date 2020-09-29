package com.dalbit.clip.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ClipStatusAgeTotalOutputVo extends BaseVo {
    private int sum_reg_12_16_cnt;		// 12-16세 등록수 합계
    private int sum_del_12_16_cnt;		// 12-16세 삭제수 합계
    private int sum_reg_17_19_cnt;		// 17-19세 등록수 합계
    private int sum_del_17_19_cnt;		// 17-19세 삭제수 합계
    private int sum_reg_20_25_cnt;		// 20-25세 등록수 합계
    private int sum_del_20_25_cnt;		// 20-25세 삭제수 합계
    private int sum_reg_26_30_cnt;		// 26-30세 등록수 합계
    private int sum_del_26_30_cnt;		// 26-30세 삭제수 합계
    private int sum_reg_31_35_cnt;		// 31-35세 등록수 합계
    private int sum_del_31_35_cnt;		// 31-35세 삭제수 합계
    private int sum_reg_36_40_cnt;		// 35-40세 등록수 합계
    private int sum_del_36_40_cnt;		// 35-40세 삭제수 합계
    private int sum_reg_41_00_cnt;		// 41세 이상 등록수 합계
    private int sum_del_41_00_cnt;		// 41세 이상 삭제수 합계
    private int sum_reg_total_cnt;		// 전체 등록수 합계
    private int sum_del_total_cnt;		// 전체 삭제수 합계
}
