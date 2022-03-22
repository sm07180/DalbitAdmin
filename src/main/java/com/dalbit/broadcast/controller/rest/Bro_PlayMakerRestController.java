package com.dalbit.broadcast.controller.rest;

import com.dalbit.broadcast.service.Bro_PlayMakerService;
import com.dalbit.broadcast.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/playmaker")
public class Bro_PlayMakerRestController {

    @Autowired
    Bro_PlayMakerService broPlayMakerService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 플레이메이커 목록 (활동중 / 미활동)
     *
     * @param pPlayMakerMemInputVo
     * @return
     */
    @GetMapping("list")
    public String list(P_PlayMakerMemInputVo pPlayMakerMemInputVo) {
        return broPlayMakerService.getList(pPlayMakerMemInputVo);
    }

    /**
     * 플레이메이커 상세
     *
     * @return
     */
    @GetMapping("player")
    public String player(P_PlayMakerMemSelInputVo pPlayMakerMemSelInputVo) {
        return broPlayMakerService.getPlayer(pPlayMakerMemSelInputVo);
    }

    /**
     * 플레이메이커 등록
     *
     * @return
     */
    @PostMapping("player")
    public String createPlayer(P_PlayMakerMemInsInputVo pPlayMakerMemInsInputVo) {
        return broPlayMakerService.createPlayer(pPlayMakerMemInsInputVo);
    }

    /**
     * 플레이메이커 수정
     *
     * @return
     */
    @PostMapping("player-update")
    public String modifyPlayer(P_PlayMakerMemInsInputVo pPlayMakerMemInsInputVo) {
        return broPlayMakerService.modifyPlayer(pPlayMakerMemInsInputVo);
    }

    /**
     * 플레이메이커 삭제
     *
     * @return
     */
    @PostMapping("player-delete")
    public String removePlayer(P_PlayMakerMemInsInputVo pPlayMakerMemInsInputVo) {
        return broPlayMakerService.removePlayer(pPlayMakerMemInsInputVo);
    }

    /**
     * 플레이메이커 상세조회 - 일간
     *
     * @param pPlayMakerDetailInputVo
     * @return
     */
    @GetMapping("day")
    public String day(P_PlayMakerDetailInputVo pPlayMakerDetailInputVo) {
        return broPlayMakerService.day(pPlayMakerDetailInputVo);
    }

    /**
     * 플레이메이커 상세조회 - 주간
     *
     * @param pPlayMakerDetailInputVo
     * @return
     */
    @GetMapping("week")
    public String week(P_PlayMakerDetailInputVo pPlayMakerDetailInputVo) {
        return broPlayMakerService.week(pPlayMakerDetailInputVo);
    }

    /**
     * 플레이메이커 상세조회 - 월간
     *
     * @param pPlayMakerDetailInputVo
     * @return
     */
    @GetMapping("month")
    public String month(P_PlayMakerDetailInputVo pPlayMakerDetailInputVo) {
        return broPlayMakerService.month(pPlayMakerDetailInputVo);
    }

    /**
     * 팀 목록
     *
     * @param pPlayMakerTeamListInputVo
     * @return
     */
    @GetMapping("teams")
    public String teams(P_PlayMakerTeamListInputVo pPlayMakerTeamListInputVo) {
        return broPlayMakerService.teams(pPlayMakerTeamListInputVo);
    }

    /**
     * 팀 등록
     *
     * @param pPlayMakerTeamInputVo
     * @return
     */
    @PostMapping("teams")
    public String createTeams(P_PlayMakerTeamInputVo pPlayMakerTeamInputVo) {
        return broPlayMakerService.createTeams(pPlayMakerTeamInputVo);
    }

    /**
     * 팀원 등록
     *
     * @param pPlayMakerTeamMemInputVoList
     * @return
     */
    @PostMapping("teams/members")
    public String createTeamMembers(@RequestBody List<P_PlayMakerTeamMemInputVo> pPlayMakerTeamMemInputVoList) {
        return broPlayMakerService.createTeamMembers(pPlayMakerTeamMemInputVoList);
    }

    /**
     * 팀원 삭제
     *
     * @param pPlayMakerTeamMemInputVo
     * @return
     */
    @PostMapping("teams/members-delete")
    public String removeTeam(P_PlayMakerTeamMemInputVo pPlayMakerTeamMemInputVo) {
        return broPlayMakerService.removeTeamMembers(pPlayMakerTeamMemInputVo);
    }

    /**
     * 팀 상세
     *
     * @param pPlayMakerTeamSelInputVo
     * @return
     */
    @GetMapping("teams/{teamNo}")
    public String team(P_PlayMakerTeamSelInputVo pPlayMakerTeamSelInputVo) {
        return broPlayMakerService.team(pPlayMakerTeamSelInputVo);
    }
}
