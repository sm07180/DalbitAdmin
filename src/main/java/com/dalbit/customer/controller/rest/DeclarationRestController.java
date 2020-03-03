package com.dalbit.customer.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.customer.service.DeclarationService;
import com.dalbit.customer.vo.DeclareVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/customer/declaration")
public class DeclarationRestController {

    @Autowired
    DeclarationService declarationService;

    @Autowired
    GsonUtil gsonUtil;


    @PostMapping("list")
    public String list(DeclareVo declareVo, HttpServletRequest request) {
        List<DeclareVo> list = declarationService.getDeclareList(declareVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));

    }

    @PostMapping("detail")
    public String detail(DeclareVo declareVo) {
        String result = declarationService.getDeclareDetail(declareVo);
        return result;
    }

}
