package com.dalbit.clip.controller.rest;

import com.dalbit.clip.service.Cli_ClipCategoryService;
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
@RequestMapping("rest/clip/category")
public class Cli_ClipCategoryRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Cli_ClipCategoryService cliClipCategoryService;

    /**
     * 차단 회원 내역 조회
     */
    @PostMapping("/list")
    public String selectBlockList(BlockAdmVo blockAdmVo) {
        return cliClipCategoryService.selectBlockList(blockAdmVo);
    }

    /**
     * 차단 내역 메시지 상세보기
     */
    @PostMapping("/detail")
    public String selectBlockDetail(BlockAdmVo blockAdmVo) {
        return cliClipCategoryService.selectBlockDetail(blockAdmVo);
    }

    /**
     * IP/Uuid 차단 (Modal)
     */
    @PostMapping("/insertBlock")
    public String insertBlock(BlockAdmVo blockAdmVo) {
        return cliClipCategoryService.insertBlock(blockAdmVo);
    }

    /**
     * 차단 내역 삭제 (차단 해지)
     */
    @PostMapping("/deleteBlock")
    public String deleteBlock(BlockAdmVo blockAdmVo) {
        return cliClipCategoryService.deleteBlock(blockAdmVo);
    }

    /**
     * 로그인 차단/해지 내역 조회
     */
    @PostMapping("/histList")
    public String historyList(BlockAdmVo blockAdmVo) {
        return cliClipCategoryService.selectBlockHistList(blockAdmVo);
    }
}
