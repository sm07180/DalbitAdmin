package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import io.swagger.models.auth.In;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_LevelListOutputVo extends PagingVo {

    // output
    private String memCount;
    private String pro;
    private Integer memAllCount;

    private String level;       //INT	 레벨
    private String grade;       //varchar 레벨명칭
    private String tot_mem_cnt;   //INT	 총인원수
    private String mem_cnt;      //INT	 테스트 제외 인원수
    private String chrgrMemCnt; //INT	 테스트 인원수
    private String tot_mem_pro;   //INT	 총 비율
    private String mem_pro;      //INT	 테스트 제외 비율
    private String levelExp;    //INT	 경험치 범위
    private String nextlevelExp;//INT	 다음레벨 경험치
    private String expRange;    //INT	 경험치 범위


}
