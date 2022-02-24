package com.dalbit.content.dao;

import com.dalbit.content.vo.procedure.P_RebrandCommentDeleteInputVo;
import com.dalbit.content.vo.procedure.P_RebrandCommentSearchInputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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
}
