package com.dalbit.sample.controller;

import com.dalbit.sample.service.SampleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("sample")
public class SampleController {

    @Autowired
    SampleService sampleService;

    @GetMapping("list")
    public String list(Model model){
        return "sample/list";
    }

    @GetMapping("select")
    public String select(Model model){
        return "sample/select";
    }

    @GetMapping("select_date")
    public String select_date(Model model){
        return "sample/select_date";
    }

    @GetMapping("select_date_edit")
    public String select_date_edit(Model model){
        return "sample/select_date_edit";
    }

    @GetMapping("index")
    public String index(Model model){
        return "sample/index";
    }

    @GetMapping("detail")
    public String detail(){
        return "sample/detail";
    }

    @GetMapping("detail2")
    public String detail2(){
        return "sample/detail2";
    }




    @GetMapping("excel")
    public String init(){
        return "sample/excel";
    }

}
