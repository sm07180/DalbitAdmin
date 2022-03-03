package com.dalbit.content.dao;

import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Con_RebrandEventDao {
    /**
     * 리브랜딩 댓글 이벤트 목록
     *
     * @param pRebrandCommentSearchInputVo
     * @return
     */
    List<Object> selectComments(P_RebrandCommentSearchInputVo pRebrandCommentSearchInputVo);

    /**
     * 리브랜딩 댓글 이벤트 삭제
     *
     * @param pRebrandCommentDeleteInputVo
     * @return
     */
    int deleteComment(P_RebrandCommentDeleteInputVo pRebrandCommentDeleteInputVo);

    /**
     * 리브랜딩 공유 이벤트 목록
     *
     * @param pRebrandShareSearchInputVo
     * @return
     */
    List<Object> selectShares(P_RebrandShareSearchInputVo pRebrandShareSearchInputVo);


    /**
     * 회차별 순위 목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    List<Object> selectCollectRankList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo);

    /**
     * 회차별 뽑기 목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    List<Object> selectCollectList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo);

    /**
     * 종합순위 목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    List<Object> selectCollectTotalList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo);

    /**
     * 지급목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    List<Object> selectCollectLogList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo);

    /**
     * 스톤지급
     *
     * @param pRebrandCollectInputVo
     * @return
     */
    int insertCollectIns(P_RebrandCollectInputVo pRebrandCollectInputVo);
}
