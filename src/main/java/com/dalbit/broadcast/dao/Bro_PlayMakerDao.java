package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Bro_PlayMakerDao {

    /**
     * 플레이메이커 목록 (활동중 / 미활동)
     *
     * @param pPlayMakerMemInputVo
     * @return
     */
    List<Object> selectList(P_PlayMakerMemInputVo pPlayMakerMemInputVo);

    /**
     * 플레이메이커 상세
     *
     * @param pPlayMakerMemSelInputVo
     * @return
     */
    P_PlayMakerMemSelOutputVo selectPlayer(P_PlayMakerMemSelInputVo pPlayMakerMemSelInputVo);

    /**
     * 플레이메이커 등록
     *
     * @param pPlayMakerMemInsInputVo
     * @return
     */
    int insertPlayer(P_PlayMakerMemInsInputVo pPlayMakerMemInsInputVo);

    /**
     * 플레이메이커 수정
     *
     * @param pPlayMakerMemInsInputVo
     * @return
     */
    int updatePlayer(P_PlayMakerMemInsInputVo pPlayMakerMemInsInputVo);

    /**
     * 플레이메이커 삭제
     *
     * @param pPlayMakerMemInsInputVo
     * @return
     */
    Integer deletePlayer(P_PlayMakerMemInsInputVo pPlayMakerMemInsInputVo);

    /**
     * 플레이메이커 일간
     *
     * @param pPlayMakerDetailInputVo
     * @return
     */
    List<Object> selectDay(P_PlayMakerDetailInputVo pPlayMakerDetailInputVo);

    /**
     * 플레이메이커 주간
     *
     * @param pPlayMakerDetailInputVo
     * @return
     */
    List<Object> selectWeek(P_PlayMakerDetailInputVo pPlayMakerDetailInputVo);

    /**
     * 플레이메이커 월간
     *
     * @param pPlayMakerDetailInputVo
     * @return
     */
    List<Object> selectMonth(P_PlayMakerDetailInputVo pPlayMakerDetailInputVo);


    /**
     * 팀 목록
     *
     * @param pPlayMakerTeamListInputVo
     * @return
     */
    List<Object> selectTeams(P_PlayMakerTeamListInputVo pPlayMakerTeamListInputVo);


    /**
     * 팀 등록
     *
     * @param pPlayMakerTeamInputVo
     * @return
     */
    int insertTeams(P_PlayMakerTeamInputVo pPlayMakerTeamInputVo);


    /**
     * 팀원 등록
     *
     * @param pPlayMakerTeamMemInputVo
     * @return
     */
    int insertTeamMembers(P_PlayMakerTeamMemInputVo pPlayMakerTeamMemInputVo);

    /**
     * 팀원 삭제
     *
     * @param pPlayMakerTeamMemInputVo
     * @return
     */
    int deleteTeamMembers(P_PlayMakerTeamMemInputVo pPlayMakerTeamMemInputVo);

    /**
     * 팀 상세
     *
     * @param pPlayMakerTeamSelInputVo
     * @return
     */
    List<P_PlayMakerTeamSelOutputVo> selectTeam(P_PlayMakerTeamSelInputVo pPlayMakerTeamSelInputVo);

    /**
     * 팀삭제
     *
     * @param pPlayMakerTeamMemInputVo
     * @return
     */
    int deleteTeam(P_PlayMakerTeamMemInputVo pPlayMakerTeamMemInputVo);
}
