package com.dalbit.sample.vo;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class SampleVo extends BaseVo {
    private String id;
    private String name;
    private int age;
}
