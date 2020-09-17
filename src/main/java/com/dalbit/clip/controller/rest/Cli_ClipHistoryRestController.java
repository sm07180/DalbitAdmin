package com.dalbit.clip.controller.rest;

import com.dalbit.clip.service.Cli_ClipHistoryService;
import com.dalbit.clip.vo.*;
import com.dalbit.clip.vo.procedure.P_ClipHistoryDetailInfoEditHistoryVo;
import com.dalbit.clip.vo.procedure.P_ClipHistoryDetailInfoEditVo;
import com.dalbit.clip.vo.procedure.P_ClipHistoryDetailInfoInputVo;
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
     * 클립 좋아요 내역 조회
     */
    @PostMapping("good/list")
    public String selectClipHistoryGoodList(ClipHistoryListenVo clipHistoryListenVo) {
        return cliClipHistoryService.callClipHistoryGoodList(clipHistoryListenVo);
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

    /**
     * 클립 댓글 내역 조회
     */
    @PostMapping("reply/detail/list")
    public String selectReplyListDetail(ClipHistoryReplyVo clipHistoryReplyVo) {
        return cliClipHistoryService.selectReplyListDetail(clipHistoryReplyVo);
    }


    /**
     * 클립 상세정보 조회
     */
    @PostMapping("/info")
    public String selectClipHistoryDetailInfo(P_ClipHistoryDetailInfoInputVo pClipHistoryDetailInfoInputVo) {
        return cliClipHistoryService.callAdminClipInfoDetail(pClipHistoryDetailInfoInputVo);
    }

    /**
     * 클립 상세정보 수정
     */
    @PostMapping("/info/edit")
    public String selectClipHistoryDetailInfoEdit(P_ClipHistoryDetailInfoEditVo pClipHistoryDetailInfoEditVo) {
        return cliClipHistoryService.callAdminClipInfoDetailEdit(pClipHistoryDetailInfoEditVo);
    }


    /**
     * 클립 상세 운영자 메모 등록
     */
    @PostMapping("/info/addmemo")
    public String selectClipHistoryDetailInfoAddMemo(P_ClipHistoryDetailInfoEditVo pClipHistoryDetailInfoEditVo) {
        return cliClipHistoryService.callAdminClipInfoDetailAddMemo(pClipHistoryDetailInfoEditVo);
    }

    /**
     * 방송방 정보수정 내역 보기
     */
    @PostMapping("/info/editHist")
    public String editHist(P_ClipHistoryDetailInfoEditHistoryVo pClipHistoryDetailInfoEditHistoryVo) {
        return cliClipHistoryService.callAdminClipEditHistory(pClipHistoryDetailInfoEditHistoryVo);
    }

    /**
     * 클립 댓글 삭제
     */
    @PostMapping("/info/delete/reply")
    public String deleteClipReply(ClipHistoryReplyVo clipHistoryReplyVo){
        return cliClipHistoryService.deleteClipReply(clipHistoryReplyVo);
    }


}