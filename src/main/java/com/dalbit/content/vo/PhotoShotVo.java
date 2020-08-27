package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PhotoShotVo extends PagingVo {

    /* input */
    private String txt_search;
    private String searchType;
    private int event_idx;
    private String[] idxArr;
    private String idxs;
    private int del_yn;

    /* output */
    private int idx;
    private String mem_no;
    private String mem_nick;
    private String image_url;
    private String contents;
    private String reg_date;
    private String mem_sex;
    private String mem_userid;
    private String mem_birth_year;

}
