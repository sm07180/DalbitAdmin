package com.dalbit.clip.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ClipStatusPlatformOutputVo extends BaseVo {
    private String the_date; 		    // 날짜
    private String the_hr; 		        // 시간
    private int reg_and_cnt; 		// 안드로이드 등록 수
    private int del_and_cnt; 		// 안드로이드 삭제 수
    private int reg_ios_cnt; 		// 아이폰 등록 수
    private int del_ios_cnt; 		// 아이폰 삭제 수
    private int reg_pc_cnt; 		// 피씨 등록 수
    private int del_pc_cnt; 		    // 피씨 삭제 수
    private int listen_and_cnt; 	// 안드로이드 청취자수
    private int listen_ios_cnt; 		// 아이폰 청취자수
    private int listen_pc_cnt; 		// 피씨 청취자수

    private int reg_total_cnt; 		// 총 등록 수
    private int del_total_cnt; 		// 총 삭제 수
    private int listen_total_cnt; 	// 총 청취자수

}
