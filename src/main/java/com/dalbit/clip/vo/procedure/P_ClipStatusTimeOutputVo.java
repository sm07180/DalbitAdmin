package com.dalbit.clip.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ClipStatusTimeOutputVo extends BaseVo {
    private String the_date;				// 날짜
    private String the_hr;					// 시간
    private int maleCnt;				// 남자 수
    private int open_reg_maleCnt;		// 남자 공개 등록 수
    private int notopen_reg_maleCnt;	// 남자 비공개 등록 수
    private int mem_del_maleCnt;		// 남자 본인 삭제 수
    private int op_del_maleCnt;			// 남자 관리자 삭제 수
    private int femaleCnt;				// 여자 수
    private int open_reg_femaleCnt;		// 여자 공개 등록 수
    private int notopen_reg_femaleCnt;	// 여자 비공개 등록 수
    private int mem_del_femaleCnt;		// 여자 본인 삭제 수
    private int op_del_femaleCnt;		// 여자 관리자 삭제 수
    private int noneCnt;				// 알수없음 수
    private int open_reg_noneCnt;		// 알수없음 공개 등록 수
    private int notopen_reg_noneCnt;	// 알수없음 비공개 등록 수
    private int mem_del_noneCnt;		// 알수없음 본인 삭제 수
    private int op_del_noneCnt;			// 알수없음 관리자 삭제 수
    private int totalCnt;				// 전체 수
    private int open_reg_totalCnt;		// 전체 공개 등록 수
    private int notopen_reg_totalCnt;	// 전체 비공개 등록 수
    private int mem_del_totalCnt;		// 전체 본인 삭제 수
    private int op_del_totalCnt;		// 전체 관리자 삭제 수
}
