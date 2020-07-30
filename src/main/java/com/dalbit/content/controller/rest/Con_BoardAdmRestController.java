package com.dalbit.content.controller.rest;

import com.dalbit.broadcast.vo.procedure.P_StoryDeleteVo;
import com.dalbit.content.service.Con_BoardAdmService;
import com.dalbit.content.vo.BoardAdmFanBoardVo;
import com.dalbit.content.vo.BoardAdmStoryVo;
import com.dalbit.member.vo.procedure.P_MemberNoticeInputVo;
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
     * 사연 조회
     */
    @PostMapping("/storyList")
    public String selectStoryList(BoardAdmStoryVo boardAdmStoryVo) {
        return conBoardAdmService.selectStoryList(boardAdmStoryVo);
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
}
