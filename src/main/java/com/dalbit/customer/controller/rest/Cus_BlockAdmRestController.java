package com.dalbit.customer.controller.rest;

import com.dalbit.customer.service.Cus_BlockAdmService;
import com.dalbit.customer.vo.BlockAdmVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/customer/blockAdm")
public class Cus_BlockAdmRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Cus_BlockAdmService cusBlockAdmService;

    /**
     * 차단 회원 내역 조회
     */
    @PostMapping("/list")
    public String selectBlockList(BlockAdmVo blockAdmVo) {
        return cusBlockAdmService.selectBlockList(blockAdmVo);
    }

    /**
     * 차단 내역 메시지 상세보기
     */
    @PostMapping("/detail")
    public String selectBlockDetail(BlockAdmVo blockAdmVo) {
        return cusBlockAdmService.selectBlockDetail(blockAdmVo);
    }
}
