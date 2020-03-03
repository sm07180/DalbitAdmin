package com.dalbit.customer.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.customer.service.QuestionService;
import com.dalbit.customer.vo.QuestionVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/customer/question")
public class QuestionRestController {

    @Autowired
    QuestionService questionService;

    @Autowired
    GsonUtil gsonUtil;


    @PostMapping("list")
    public String list(QuestionVo questionVo, HttpServletRequest request){
        List<QuestionVo> list = questionService.getQuestionList(questionVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }

    @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model) throws GlobalException {
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }
}
