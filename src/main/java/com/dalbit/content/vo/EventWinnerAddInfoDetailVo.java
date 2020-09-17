package com.dalbit.content.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EventWinnerAddInfoDetailVo {
    /* input */
    private String winner_mem_no;
    private int prizeIdx;
    private int eventIdx;

    /* output */
    private String winnerName;
    private String winnerSocialNo;
    private String winnerPhone;
    private String winnerEmail;
    private String winnerPostCode;
    private String winnerAddress1;
    private String winnerAddress2;
    private String winnerAddFile1;
    private String winnerAddFile2;
    private int minorYn;
}
