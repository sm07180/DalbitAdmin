package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_EmoticonListOutputVo extends BaseVo {
    private int idx; 					// 고유 인덱스
    private int emoticon_orderNo; 		// 이모티콘 순번
    private int categoryNo; 			// 카테고리번호
    private String categoryNm; 			// 카테고리명
    private String emoticon_desc; 			// 이모티콘 내용
    private Date regDate; 				// 등록 일자
    private String regDateFormat; 				// 등록 일자
    private int total_clickCnt; 		// 클릭 수
    private int daily_clickCnt; 		// 일별 클릭 수
    private int viewOn; 				// 노출여부 (1:ON, 0:OFF)

    public void setReg_date(Date reg_date){
        this.regDate = reg_date;
        this.regDateFormat = DalbitUtil.convertDateFormat(reg_date, "yyyy.MM.dd HH:mm:ss");
    }
}
