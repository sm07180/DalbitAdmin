package com.dalbit.content.controller.rest;

import com.dalbit.broadcast.vo.procedure.P_StoryDeleteVo;
import com.dalbit.content.service.Con_BoardAdmService;
import com.dalbit.content.vo.BoardAdmFanBoardDeleteVo;
import com.dalbit.content.vo.BoardAdmFanBoardReplyVo;
import com.dalbit.content.vo.BoardAdmFanBoardVo;
import com.dalbit.content.vo.BoardAdmStoryVo;
import com.dalbit.member.vo.procedure.P_MemberNoticeInputVo;
import com.dalbit.member.vo.procedure.P_MemberProfileInputVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/rest/content/boardAdm")
public class Con_BoardAdmRestController {

    @Autowired
    Con_BoardAdmService conBoardAdmService;


    /**
     * 팬보드 조회
     */
    @PostMapping("/fanBoardList")
    public String selectFanBoardList(BoardAdmFanBoardVo boardAdmFanBoardVo) {
        return conBoardAdmService.selectFanBoardList(boardAdmFanBoardVo);
    }

    /**
     * 팬보드 통계
     */
    @PostMapping("/fanBoardList/summary")
    public String selectFanBoardSummary(BoardAdmFanBoardVo boardAdmFanBoardVo) {
        return conBoardAdmService.selectFanBoardSummary(boardAdmFanBoardVo);
    }

    /**
     * 팬보드 삭제
     */
    @PostMapping("/deleteFanBoard")
    public String deleteFanBoard(BoardAdmFanBoardDeleteVo boardAdmFanBoardDeleteVo) {
        return conBoardAdmService.deleteFanBoard(boardAdmFanBoardDeleteVo);
    }

    /**
     * 팬보드 리플 조회
     */
    @PostMapping("/selectReply")
    public String selectReply(BoardAdmFanBoardReplyVo boardAdmFanBoardReplyVo) {
        return conBoardAdmService.selectReply(boardAdmFanBoardReplyVo);
    }

    /**
     * 사연 조회
     */
    @PostMapping("/storyList")
    public String selectStoryList(BoardAdmStoryVo boardAdmStoryVo) {
        return conBoardAdmService.selectStoryList(boardAdmStoryVo);
    }

    /**
     * 사연 통계
     */
    @PostMapping("/storyList/summary")
    public String selectstoryListSummary(BoardAdmStoryVo boardAdmStoryVo) {
        return conBoardAdmService.selectStorySummary(boardAdmStoryVo);
    }

    /**
     * 사연 삭제
     */
    @PostMapping("/deleteStory")
    public String deleteStory(P_StoryDeleteVo pStoryDeleteVo) {
        return conBoardAdmService.callStoryDelete(pStoryDeleteVo);
    }

    /**
     * 회원/방송공지 조회
     */
    @PostMapping("/noticeList")
    public String noticeList(P_MemberNoticeInputVo pMemberNoticeInputVo) {
        return conBoardAdmService.selectNoticeList(pMemberNoticeInputVo);
    }

    /**
     * 공지 통계
     * @param pMemberNoticeInputVo
     * @return
     */
    @PostMapping("/noticeList/summary")
    public String noticeListSummary(P_MemberNoticeInputVo pMemberNoticeInputVo) {
        return conBoardAdmService.selectNoticeSummary(pMemberNoticeInputVo);
    }

    /**
     * 프로필메세지 조회
     */
    @PostMapping("/profileMsgList")
    public String profileMsgList(P_MemberProfileInputVo pMemberNoticeInputVo) {
        return conBoardAdmService.selectprofileMsgList(pMemberNoticeInputVo);
    }

    /**
     * 프로필메세지 통계
     * @param pMemberProfileInputVo
     * @return
     */
    @PostMapping("/profileMsg/summary")
    public String profileMsgListSummary(P_MemberProfileInputVo pMemberProfileInputVo) {
        return conBoardAdmService.profileMsgListSummary(pMemberProfileInputVo);
    }

    /**
     * 프로필메시지 삭제
     */
    @PostMapping("/profileMsg/del")
    public String profileMsgDel(P_MemberProfileInputVo pMemberProfileInputVo) {
        return conBoardAdmService.profileDelete(pMemberProfileInputVo);
    }
}
