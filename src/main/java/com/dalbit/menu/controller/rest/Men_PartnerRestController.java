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
@RequestMapping("rest/menu/partner")
public class Men_PartnerRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Men_PartnerService menPartnerService;

    /**
     * 파트너DJ 목록
     *
     * @return
     */
    @GetMapping("list")
    public String list(P_PartnerInputVo pPartnerInputVo) {
        return menPartnerService.list(pPartnerInputVo);
    }

    /**
     * 파트너DJ 등록
     *
     * @return
     */
    @PostMapping("create")
    public String create(P_PartnerBenefitInputVo pPartnerBenefitInputVo) {
        return menPartnerService.create(pPartnerBenefitInputVo);
    }

    /**
     * 파트너DJ 수정
     *
     * @return
     */
    @PostMapping("modify")
    public String modify(P_PartnerBenefitInputVo pPartnerBenefitInputVo) {
        return menPartnerService.modify(pPartnerBenefitInputVo);
    }

    /**
     * 파트너DJ 등록 취소
     *
     * @param pPartnerCancelInputVo
     * @return
     */
    @PostMapping("cancel")
    public String cancel(P_PartnerCancelInputVo pPartnerCancelInputVo) {
        return menPartnerService.cancel(pPartnerCancelInputVo);
    }

    /**
     * 파트너DJ 검색
     *
     * @param pPartnerInputVo
     * @return
     */
    @GetMapping("search")
    public String search(P_PartnerInputVo pPartnerInputVo) {
        return menPartnerService.search(pPartnerInputVo);
    }
}
