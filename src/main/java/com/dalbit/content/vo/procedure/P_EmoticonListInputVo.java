package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_EmoticonListInputVo extends SearchVo {
    private String mem_no;             // 회원번호
    private int categoryNo;        //카테고리번호 ( -1(or null): all, 1:기쁨, 2:슬픔, 3:당황, 4:화남, 5:놀람)
//    private int viewOn;             //노출여부 ( -1(or null): all, 1:ON, 0:OFF )
}
