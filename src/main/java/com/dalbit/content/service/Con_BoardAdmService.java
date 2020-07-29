package com.dalbit.content.service;

import com.dalbit.broadcast.vo.procedure.P_StoryDeleteVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.Con_BoardAdmDao;
import com.dalbit.content.vo.BoardAdmStoryVo;
import com.dalbit.member.dao.Mem_NoticeDao;
import com.dalbit.member.vo.procedure.P_MemberNoticeInputVo;
import com.dalbit.member.vo.procedure.P_MemberNoticeOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Con_BoardAdmService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Con_BoardAdmDao conBoardAdmDao;

    @Autowired
    Mem_NoticeDao mem_NoticeDao;

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


    /**
     * 회원/방송공지 조회
     */
    public String selectNoticeList(P_MemberNoticeInputVo pMemberNoticeInputVo) {
        pMemberNoticeInputVo.setPageNo(pMemberNoticeInputVo.getPageNo() -1);
        pMemberNoticeInputVo.setPageNo(pMemberNoticeInputVo.getPageNo() * pMemberNoticeInputVo.getPageCnt());
        int totalCnt = mem_NoticeDao.callNoticeHistory_totalCnt(pMemberNoticeInputVo);
        ArrayList<P_MemberNoticeOutputVo> noticeList = mem_NoticeDao.callNoticeHistory(pMemberNoticeInputVo);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.공지보기성공, noticeList, new PagingVo(totalCnt)));
        return result;

    }
}
