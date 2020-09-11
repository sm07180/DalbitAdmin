package com.dalbit.clip.controller.rest;

import com.dalbit.clip.service.Cli_ClipHistoryService;
import com.dalbit.clip.vo.*;
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
//        return cliClipHistoryService.selectClipHistoryList(clipHistoryVo);
        return cliClipHistoryService.callClipHistoryList(clipHistoryVo);
    }

    /**
     * 클립 내역(회원) 조회
     */
    @PostMapping("/member/list")
    public String selectClipHistoryMemberList(ClipHistoryMemberVo clipHistoryMemberVo) {
        return cliClipHistoryService.callClipHistoryMemberList(clipHistoryMemberVo);
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
//        return cliClipHistoryService.selectClipHistoryListenList(clipHistoryListenVo);
        return cliClipHistoryService.callClipHistoryListenList(clipHistoryListenVo);
    }

    /**
     * 클립 선물 내역 조회
     */
    @PostMapping("gift/list")
    public String selectClipHistoryGiftList(ClipHistoryGiftVo clipHistoryGiftVo) {
        return cliClipHistoryService.callClipHistoryGiftList(clipHistoryGiftVo);
    }

    /**
     * 클립 삭제 내역 조회
     */
    @PostMapping("remove/list")
    public String selectClipHistoryRemoveList(ClipHistoryRemoveVo clipHistoryRemoveVo) {
//        return cliClipHistoryService.selectClipHistoryRemoveList(clipHistoryRemoveVo);
        return cliClipHistoryService.callClipHistoryRemoveList(clipHistoryRemoveVo);
    }


    /**
     * 클립 댓글 내역 조회
     */
    @PostMapping("reply/list")
    public String selectReplyList(ClipHistoryReplyVo clipHistoryReplyVo) {
        return cliClipHistoryService.selectReplyList(clipHistoryReplyVo);
    }

}
