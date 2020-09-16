package com.dalbit.clip.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ClipHistoryDetailInfoEditHistoryVo extends SearchVo {

    private String cast_no;				// 클립번호
    private String editDate;      // 수정일자
    private String editType;      // 수정구분
    private String editContents;      // 수정내용

}
