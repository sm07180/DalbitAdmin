package com.dalbit.content.dao;

import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Con_TeamDao {
    /**
     * 팀 목록
     * @param pTeamSearchInputVo
     * @return
     */
    List<Object> selectTeams(P_TeamSearchInputVo pTeamSearchInputVo);

    /**
     * 팀 목록 (삭제)
     * @param pTeamSearchInputVo
     * @return
     */
    List<Object> selectTeamsDeleted(P_TeamSearchInputVo pTeamSearchInputVo);

    /**
     * 팀 상세
     * @param pTeamSearchInputVo
     * @return
     */
    List<Object> selectTeam(P_TeamSearchInputVo pTeamSearchInputVo);

    /**
     * 팀 상세 (삭제)
     * @param pTeamSearchInputVo
     * @return
     */
    List<Object> selectTeamDeleted(P_TeamSearchInputVo pTeamSearchInputVo);

    /**
     * 팀 상세 - 팀원 (삭제)
     * @param pTeamSearchInputVo
     * @return
     */
    List<Object> selectTeamDeletedMember(P_TeamSearchInputVo pTeamSearchInputVo);

    /**
     * 팀 심볼 등록
     * @param pTeamSymbolInputVo
     * @return
     */
    int insertTeamSymbol(P_TeamSymbolInputVo pTeamSymbolInputVo);

    /**
     * 팀 심볼 수정
     * @param pTeamSymbolInputVo
     * @return
     */
    int updateTeamSymbol(P_TeamSymbolInputVo pTeamSymbolInputVo);

    /**
     * 팀 활동배지 수정
     * @param pTeamBadgeInputVo
     * @return
     */
    int updateTeamBadge(P_TeamBadgeInputVo pTeamBadgeInputVo);

    /**
     * 팀 심볼 리스트
     * @param pTeamSearchSymbolInputVo
     * @return
     */
    List<Object> selectTeamsSymbols(P_TeamSearchSymbolInputVo pTeamSearchSymbolInputVo);

    /**
     * 팀 활동배지 리스트
     * @param pTeamSearchSymbolInputVo
     * @return
     */
    List<Object> selectTeamsBadges(P_TeamSearchSymbolInputVo pTeamSearchSymbolInputVo);

    /**
     * 팀 집계
     * @param pTeamSearchInputVo
     * @return
     */
    List<P_TeamMonthStatOutputVo> selectTeamsMonthStat(P_TeamSearchInputVo pTeamSearchInputVo);
}
