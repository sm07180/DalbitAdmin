package com.dalbit.clip.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClipHistoryVo extends PagingVo {

    /* input */
    private String searchType;
    private String searchText;
    private String search_testId;
    private String searchHistText;
    private String orderByType;
    private String slctType;
    private String isChoiceDate;

    /* output */
    private String clipIdx;
    private String castNo;
    private String subjectType;
    private String subjectName;
    private String title;
    private String typeEntry;
    private String imageBackground;
    private String fileName;
    private String filePath;
    private String filePlay;
    private String memNo;
    private String memSex;
    private String memBirthYear;
    private String memNick;
    private String typeOpen;
    private String state;
    private String hide;
    private String codeLink;
    private String countPlay;
    private String countGood;
    private String countGift;
    private String countByeol;
    private String startDate;
    private String endDate;
    private String badgeNewdj;
    private String osType;
    private String lastUpdDate;
    private String memInsertCnt;
    private String inner;
    private String replyCnt;


}
