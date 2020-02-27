package com.dalbit.customer.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.customer.service.DeclarationService;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@RestController
@RequestMapping("rest/customer/declaration")
public class DeclarationRestController {

    @Autowired
    DeclarationService declarationService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * Declaration Rest List
     * @param model
     * @return
     */

    @PostMapping("list")
    public String list(Model model) {
        ArrayList<HashMap> list = new ArrayList<HashMap>();
        HashMap map = new HashMap();

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));

    }

}
