package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_EmoticonInsertVo extends BaseVo {
    private String categoryNm; 		// 카테고리명
    private String emoticon_desc; 		// 이모티콘 내용
}

