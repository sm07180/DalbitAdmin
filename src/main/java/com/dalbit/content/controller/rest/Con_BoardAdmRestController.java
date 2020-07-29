package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_BoardAdmService;
import com.dalbit.content.vo.BoardAdmStoryVo;
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
     * 사연 조회
     */
    @PostMapping("/storyList")
    public String selectStoryList(BoardAdmStoryVo boardAdmStoryVo) {
        return conBoardAdmService.selectStoryList(boardAdmStoryVo);
    }
}
