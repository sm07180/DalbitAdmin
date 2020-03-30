package com.dalbit.customer.controller.rest;

import com.dalbit.customer.service.Cus_QuestionService;
import com.dalbit.customer.vo.procedure.P_QuestionListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/customer/question")
public class Cus_QuestionRestController {

    @Autowired
    Cus_QuestionService cus_questionService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 1:1 신고 목록 조회
     */
    @PostMapping("list")
    public String list(P_QuestionListInputVo pQuestionListInputVo) {

        String result = cus_questionService.getQuestionList(pQuestionListInputVo);

        return result;
    }

//    @PostMapping("listExcel")
//    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model) throws GlobalException {
//        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
//    }
}
