package com.dalbit.clip.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ClipStatusSubjectOutputVo extends BaseVo {
    private String the_date;		// 날짜
    private String the_hr;			// 시간
    private int reg_01_cnt;			// 주제01 등록수
    private int del_01_cnt;			// 주제01 삭제수
    private int play_01_cnt;		// 주제01 청취자수
    private int reg_02_cnt;			// 주제02 등록수
    private int del_02_cnt;			// 주제02 삭제수
    private int play_02_cnt;		// 주제02 청취자수
    private int reg_03_cnt;			// 주제03 등록수
    private int del_03_cnt;			// 주제03 삭제수
    private int play_03_cnt;		// 주제03 청취자수
    private int reg_04_cnt;			// 주제04 등록수
    private int del_04_cnt;			// 주제04 삭제수
    private int play_04_cnt;		// 주제04 청취자수
    private int reg_05_cnt;			// 주제05 등록수
    private int del_05_cnt;			// 주제05 삭제수
    private int play_05_cnt;		// 주제05 청취자수
    private int reg_06_cnt;			// 주제06 등록수
    private int del_06_cnt;			// 주제06 삭제수
    private int play_06_cnt;		// 주제06 청취자수
    private int reg_07_cnt;			// 주제07 등록수
    private int del_07_cnt;			// 주제07 삭제수
    private int play_07_cnt;		// 주제07 청취자수
    private int reg_08_cnt;			// 주제08 등록수
    private int del_08_cnt;			// 주제08 삭제수
    private int play_08_cnt;		// 주제08 청취자수
    private int reg_09_cnt;			// 주제09 등록수
    private int del_09_cnt;			// 주제09 삭제수
    private int play_09_cnt;		// 주제09 청취자수
    private int reg_10_cnt;			// 주제10 등록수
    private int del_10_cnt;			// 주제10 삭제수
    private int play_10_cnt;		// 주제10 청취자수
    private int reg_99_cnt;			// 주제99 등록수
    private int del_99_cnt;			// 주제99 삭제수
    private int play_99_cnt;		// 주제99 청취자수

    private int reg_total_cnt;			// 주제 총 등록수
    private int del_total_cnt;			// 주제 총 삭제수
    private int play_total_cnt;		// 주제 총 청취자수
}
