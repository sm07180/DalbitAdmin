package com.dalbit.menu.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.menu.vo.DjRankingVo;
import com.dalbit.menu.vo.FanRankingVo;
import com.dalbit.menu.vo.procedure.P_MainDjRankingVo;
import com.dalbit.menu.vo.procedure.P_MainFanRankingVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface Men_RankDao {
    @Transactional(readOnly = true)
    List<P_MainDjRankingVo> callMainDjRanking(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    List<P_MainFanRankingVo> callMainFanRanking(ProcedureVo procedureVo);

    /* DJ 랭킹 */
    List<DjRankingVo> getMainDjRankingList(DjRankingVo djRankingVo);
    int getMainDjRankingListCnt(DjRankingVo djRankingVo);

    /* fan 랭킹*/
    List<FanRankingVo> getMainFanRankingList(FanRankingVo fanRankingVo);
    int getMainFanRankingListCnt(FanRankingVo fanRankingVo);
}
