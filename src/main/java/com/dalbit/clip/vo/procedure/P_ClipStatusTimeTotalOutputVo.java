package com.dalbit.clip.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ClipStatusTimeTotalOutputVo extends BaseVo {
    private int sum_maleCnt;	// 남자 수 합계
    private int sum_open_reg_maleCnt;	// 남자 공개 등록 수
    private int sum_notopen_reg_maleCnt;	// 남자 비공개 등록 수
    private int sum_mem_del_maleCnt;	// 남자 본인 삭제 수
    private int sum_op_del_maleCnt;	// 남자 관리자 삭제 수
    private int sum_femaleCnt;	// 여자 수 합계
    private int sum_open_reg_femaleCnt;	// 여자 공개 등록 수
    private int sum_notopen_reg_femaleCnt;	// 여자 비공개 등록 수
    private int sum_mem_del_femaleCnt;	// 여자 본인 삭제 수
    private int sum_op_del_femaleCnt;	// 여자 관리자 삭제 수
    private int sum_noneCnt;	// 알수없음 수 합계
    private int sum_open_reg_noneCnt;	// 알수없음 공개 등록 수
    private int sum_notopen_reg_noneCnt;	// 알수없음 비공개 등록 수
    private int sum_mem_del_noneCnt;	// 알수없음 본인 삭제 수
    private int sum_op_del_noneCnt;	// 알수없음 관리자 삭제 수
    private int sum_totalCnt;	// 전체 합계
    private int sum_open_reg_totalCnt;	// 전체 공개 등록 수
    private int sum_notopen_reg_totalCnt;	// 전체 비공개 등록 수
    private int sum_mem_del_totalCnt;	// 전체 본인 삭제 수
    private int sum_op_del_totalCnt;	// 전체 관리자 삭제 수
}
