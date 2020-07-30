package com.dalbit.content.service;

import com.dalbit.broadcast.vo.procedure.P_StoryDeleteVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.Con_BoardAdmDao;
import com.dalbit.content.vo.BoardAdmFanBoardDeleteVo;
import com.dalbit.content.vo.BoardAdmFanBoardReplyVo;
import com.dalbit.content.vo.BoardAdmFanBoardVo;
import com.dalbit.content.vo.BoardAdmStoryVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.member.dao.Mem_NoticeDao;
import com.dalbit.member.vo.procedure.P_MemberNoticeInputVo;
import com.dalbit.member.vo.procedure.P_MemberNoticeOutputVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import springfox.documentation.spring.web.json.Json;

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
     * 팬보드 조회
     */
    public String selectFanBoardList(BoardAdmFanBoardVo boardAdmFanBoardVo) {
        int fanBoardCount = conBoardAdmDao.selectFanBoardListCnt(boardAdmFanBoardVo);
        boardAdmFanBoardVo.setTotalCnt(fanBoardCount);
        ArrayList<BoardAdmFanBoardVo> fanBoardList = conBoardAdmDao.selectFanBoardList(boardAdmFanBoardVo);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.Fan목록보기성공, fanBoardList, new PagingVo(boardAdmFanBoardVo.getTotalCnt(), boardAdmFanBoardVo.getPageStart(), boardAdmFanBoardVo.getPageCnt())));

        return result;
    }

    /**
     * 팬보드 삭제
     */
    public String deleteFanBoard(BoardAdmFanBoardDeleteVo boardAdmFanBoardDeleteVo) {
        boardAdmFanBoardDeleteVo.setContents("삭제되었습니다");
        int result = conBoardAdmDao.deleteFanBoard(boardAdmFanBoardDeleteVo);

        if(result > 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.Fanboard삭제성공));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.Fanboard삭제실패));
        }
    }

    /**
     * 팬보드 리플 조회
     */
    public String selectReply(BoardAdmFanBoardReplyVo boardAdmFanBoardReplyVo) {
        ArrayList<BoardAdmFanBoardReplyVo> replyList = conBoardAdmDao.selectReply(boardAdmFanBoardReplyVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.FanboardReply목록보기성공, replyList));
    }

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
