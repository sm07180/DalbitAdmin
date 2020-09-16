package com.dalbit.clip.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClipEditHistoryVo extends PagingVo {

    private String idx;
    private String edit_contents;		//수정 내용
    private String edit_type;			//수정 코드 (0: 숨기기해제, 1: 숨기기)
    private String last_upd_date;		//수정일자
    private String op_name;				//수정자
    private String memo;				//메모
    private String castNo;				//수정 ClipNo
    private String replyIdx;				//수정 replyIdx

}
