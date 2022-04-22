package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_MemberFeedPhotoOutputVo {
    private int photo_no;           // 사진번호
    private int feed_reg_no;        // 피드번호
    private String mem_no;          // 회원번호
    private String img_name;        // 이미지 이름
    private Date ins_date;          // 등록일
}
