package com.dalbit.main.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PayStatusInputVo {

    PayStatusInputVo(){

    }

    public PayStatusInputVo(String date){
        setSearchDate(date);
    }

    public PayStatusInputVo(String startDate, String endDate){
        setSearchStartDate(startDate);
        setSearchEndDate(endDate);
    }

    private String today;
    private String yesterday;
    private String thisWeekStartDay;
    private String thisWeekEndDay;
    private String prevWeekStartDay;
    private String prevWeekEndDay;

    private String searchDate;
    private String searchStartDate;
    private String searchEndDate;

}
