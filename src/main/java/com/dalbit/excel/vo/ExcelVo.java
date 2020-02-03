package com.dalbit.excel.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ExcelVo {

    public ExcelVo(){}

    public ExcelVo(String[] headers, List<Object[]> bodies){
        this.headers = headers;
        this.bodies = bodies;
    }

    public ExcelVo(String[] headers, int[] headerWidths, List<Object[]> bodies){
        this.headers = headers;
        this.headerWidths = headerWidths;
        this.bodies = bodies;
    }

    public ExcelVo(List<Object[]> bodies){
        this.bodies = bodies;
    }

    // 헤더 네이밍
    private String[] headers;
    // 헤더 넓이
    private int[] headerWidths;
    // 바디 정보
    private List<Object[]> bodies;
}
