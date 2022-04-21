package com.dalbit.menu.controller.rest;

import com.dalbit.menu.service.Men_PartnerService;
import com.dalbit.menu.vo.procedure.P_PartnerBenefitInputVo;
import com.dalbit.menu.vo.procedure.P_PartnerCancelInputVo;
import com.dalbit.menu.vo.procedure.P_PartnerInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/menu/star")
public class Men_StarRestController {

    @Autowired
    GsonUtil gsonUtil;


}
