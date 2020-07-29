package com.dalbit.content.service;

import com.dalbit.broadcast.vo.procedure.P_StoryDeleteVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.Con_BoardAdmDao;
import com.dalbit.content.vo.BoardAdmStoryVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dalbit.common.code.*;

import java.util.ArrayList;

@Slf4j
@Service
public class Con_BoardAdmService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Con_BoardAdmDao conBoardAdmDao;


    /**
     * 사연 조회
     */
    public String selectStoryList(BoardAdmStoryVo boardAdmStoryVo) {
        int storyCount = conBoardAdmDao.selectStoryListCnt(boardAdmStoryVo);
        boardAdmStoryVo.setTotalCnt(storyCount);
        ArrayList<BoardAdmStoryVo> storyList = conBoardAdmDao.selectStoryList(boardAdmStoryVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, storyList, new PagingVo(boardAdmStoryVo.getTotalCnt(), boardAdmStoryVo.getPageStart(), boardAdmStoryVo.getPageCnt())));

        return result;
    }

    /**
     * 사연 삭제
     */
    public String callStoryDelete(P_StoryDeleteVo pStoryDeleteVo) {
        ProcedureVo procedureVo = new ProcedureVo(pStoryDeleteVo);
        conBoardAdmDao.callStoryDelete(procedureVo);

        String result = "";
        if(Status.생방송_사연삭제_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_사연삭제_성공));
        } else if(Status.생방송_사연삭제_번호없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_사연삭제_번호없음));
        } else if(Status.생방송_사연삭제_방번호틀림.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_사연삭제_방번호틀림));
        }
        return result;
    }
}
