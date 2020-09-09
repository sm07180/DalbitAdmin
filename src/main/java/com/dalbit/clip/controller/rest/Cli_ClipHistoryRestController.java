package com.dalbit.clip.controller.rest;

import com.dalbit.clip.service.Cli_ClipHistoryService;
import com.dalbit.clip.vo.ClipHistoryListenVo;
import com.dalbit.clip.vo.ClipHistoryRemoveVo;
import com.dalbit.clip.vo.ClipHistoryReplyVo;
import com.dalbit.clip.vo.ClipHistoryVo;
import com.dalbit.customer.vo.BlockAdmVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/clip/history")
public class Cli_ClipHistoryRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Cli_ClipHistoryService cliClipHistoryService;

    /**
     * 클립 내역 조회
     */
    @PostMapping("/list")
    public String selectClipHistoryList(ClipHistoryVo clipHistoryVo) {
        return cliClipHistoryService.selectClipHistoryList(clipHistoryVo);
    }

    /**
     * 클립 숨기기/해제
     */
    @PostMapping("/updateHide")
    public String updateHide(ClipHistoryVo clipHistoryVo){
        return cliClipHistoryService.updateHide(clipHistoryVo);
    }

    /**
     * 클립 삭제
     */
    @PostMapping("/deleteClip")
    public String deleteClip(ClipHistoryVo clipHistoryVo){
        return cliClipHistoryService.deleteClip(clipHistoryVo);
    }

    /**
     * 클립 청취 내역 조회
     */
    @PostMapping("listen/list")
    public String selectClipHistoryListenList(ClipHistoryListenVo clipHistoryListenVo) {
        return cliClipHistoryService.selectClipHistoryListenList(clipHistoryListenVo);
    }

    /**
     * 클립 삭제 내역 조회
     */
    @PostMapping("remove/list")
    public String selectClipHistoryRemoveList(ClipHistoryRemoveVo clipHistoryRemoveVo) {
        return cliClipHistoryService.selectClipHistoryRemoveList(clipHistoryRemoveVo);
    }


    /**
     * 클립 댓글 내역 조회
     */
    @PostMapping("reply/list")
    public String selectReplyList(ClipHistoryReplyVo clipHistoryReplyVo) {
        return cliClipHistoryService.selectReplyList(clipHistoryReplyVo);
    }



    /**
     * 차단 내역 메시지 상세보기
     */
    @PostMapping("/detail")
    public String selectBlockDetail(BlockAdmVo blockAdmVo) {
        return cliClipHistoryService.selectBlockDetail(blockAdmVo);
    }

    /**
     * IP/Uuid 차단 (Modal)
     */
    @PostMapping("/insertBlock")
    public String insertBlock(BlockAdmVo blockAdmVo) {
        return cliClipHistoryService.insertBlock(blockAdmVo);
    }

    /**
     * 차단 내역 삭제 (차단 해지)
     */
    @PostMapping("/deleteBlock")
    public String deleteBlock(BlockAdmVo blockAdmVo) {
        return cliClipHistoryService.deleteBlock(blockAdmVo);
    }

    /**
     * 로그인 차단/해지 내역 조회
     */
    @PostMapping("/histList")
    public String historyList(BlockAdmVo blockAdmVo) {
        return cliClipHistoryService.selectBlockHistList(blockAdmVo);
    }
}
