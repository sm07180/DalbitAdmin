package com.dalbit.menu.dao;

import com.dalbit.menu.vo.procedure.P_StarInputVo;
import com.dalbit.menu.vo.procedure.P_StarScoreInputVo;
import com.dalbit.menu.vo.procedure.P_StarSearchInputVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Men_StarDao {
    /**
     * 스타 dj 등록 후 달/부스터/아이템 지급
     * @param pStarInputVo
     * @return
     */
    int insertStarDJ(P_StarInputVo pStarInputVo);

    /**
     * 스타 dj 삭제
     * @param pStarInputVo
     * @return
     */
    int deleteStarDJ(P_StarInputVo pStarInputVo);

    /**
     * 스타DJ 가산점 점수 수정
     * @param pStarScoreInputVo
     * @return
     */
    int updateStarDJ(P_StarScoreInputVo pStarScoreInputVo);

    /**
     * 스타 DJ 신청 리스트
     * @param pStarSearchInputVo
     * @return
     */
    List<Object> selectReqStarDJ(P_StarSearchInputVo pStarSearchInputVo);

    /**
     * 스타 DJ 리스트
     * @param pStarSearchInputVo
     * @return
     */
    List<Object> selectStarDJ(P_StarSearchInputVo pStarSearchInputVo);
}
