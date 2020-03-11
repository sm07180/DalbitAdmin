package com.dalbit.customer.controller.rest;

import com.dalbit.customer.service.DeclarationService;
import com.dalbit.customer.vo.procedure.P_DeclarationInputListVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Slf4j
@RestController
@RequestMapping("rest/customer/declaration")
public class DeclarationRestController {

    @Autowired
    DeclarationService declarationService;

    @Autowired
    GsonUtil gsonUtil;


    /**
     * 신고 목록 조회
     */
    @PostMapping("list")
    public String list(P_DeclarationInputListVo pDeclarationInputListVo) {

        String result = declarationService.callServiceCenterReportList(pDeclarationInputListVo);

        return result;
    }

    /**
     * 신고 목록 상세 조회
     */


}
