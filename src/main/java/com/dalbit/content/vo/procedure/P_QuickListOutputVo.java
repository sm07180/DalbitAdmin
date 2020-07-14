package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_QuickListOutputVo extends BaseVo {

    private String item_code;
    private String item_name;
    private String use_day;
    private String item_price;
    private String pcPrice;
    private String aosPrice;
    private String iosPrice;


}
