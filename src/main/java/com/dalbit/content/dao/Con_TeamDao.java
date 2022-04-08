package com.dalbit.content.dao;

import com.dalbit.content.vo.procedure.P_TeamSearchInputVo;
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
}
