package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_TeamService;
import com.dalbit.content.vo.procedure.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/rest/content/team")
public class Con_TeamRestController {

    @Autowired
    Con_TeamService con_teamService;

    /**
     * 팀 목록
     *
     * @param pTeamSearchInputVo
     * @return
     */
    @GetMapping("/list")
    public String getTeams(P_TeamSearchInputVo pTeamSearchInputVo) {
        return con_teamService.getTeams(pTeamSearchInputVo);
    }

    /**
     * 팀 목록 (삭제)
     *
     * @param pTeamSearchInputVo
     * @return
     */
    @GetMapping("/list-deleted")
    public String getTeamsDeleted(P_TeamSearchInputVo pTeamSearchInputVo) {
        return con_teamService.getTeamsDeleted(pTeamSearchInputVo);
    }

    /**
     * 팀 상세
     *
     * @param pTeamSearchInputVo
     * @return
     */
    @GetMapping("/detail")
    public String getTeam(P_TeamSearchInputVo pTeamSearchInputVo) {
        return con_teamService.getTeam(pTeamSearchInputVo);
    }

    /**
     * 팀 상세 (삭제)
     *
     * @param pTeamSearchInputVo
     * @return
     */
    @GetMapping("/detail-deleted")
    public String getTeamDeleted(P_TeamSearchInputVo pTeamSearchInputVo) {
        return con_teamService.getTeamDeleted(pTeamSearchInputVo);
    }

    /**
     * 팀 상세 - 팀원 (삭제)
     *
     * @param pTeamSearchInputVo
     * @return
     */
    @GetMapping("/member-deleted")
    public String getTeamDeletedMember(P_TeamSearchInputVo pTeamSearchInputVo) {
        return con_teamService.getTeamDeletedMember(pTeamSearchInputVo);
    }

    /**
     * 팀 심볼 등록
     *
     * @param pTeamSymbolInputVo
     * @return
     */
    @PostMapping("/symbols")
    public String createTeamSymbol(P_TeamSymbolInputVo pTeamSymbolInputVo) {
        return con_teamService.createTeamSymbol(pTeamSymbolInputVo);
    }

    /**
     * 팀 심볼 수정
     *
     * @param pTeamSymbolInputVo
     * @return
     */
    @PostMapping("/symbol-update")
    public String modifyTeamSymbol(P_TeamSymbolInputVo pTeamSymbolInputVo) {
        return con_teamService.modifyTeamSymbol(pTeamSymbolInputVo);
    }

    /**
     * 팀 활동배지 수정
     *
     * @param pTeamBadgeInputVo
     * @return
     */
    @PostMapping("/badge-update")
    public String modifyTeamSymbol(P_TeamBadgeInputVo pTeamBadgeInputVo) {
        return con_teamService.modifyTeamBadge(pTeamBadgeInputVo);
    }

    /**
     * 팀 심볼 리스트
     *
     * @param pTeamSearchSymbolInputVo
     * @return
     */
    @GetMapping("/symbols")
    public String getTeamsSymbols(P_TeamSearchSymbolInputVo pTeamSearchSymbolInputVo) {
        return con_teamService.getTeamsSymbols(pTeamSearchSymbolInputVo);
    }

    /**
     * 팀 활동배지 리스트
     * @param pTeamSearchSymbolInputVo
     * @return
     */
    @GetMapping("/badges")
    public String getTeamsBadges(P_TeamSearchSymbolInputVo pTeamSearchSymbolInputVo) {
        return con_teamService.getTeamsBadges(pTeamSearchSymbolInputVo);
    }

    /**
     * 팀 집계
     * @param pTeamSearchInputVo
     * @return
     */
    @GetMapping("/stat")
    public String getTeamsMonthStat(P_TeamSearchInputVo pTeamSearchInputVo) {
        return con_teamService.getTeamsMonthStat(pTeamSearchInputVo);
    }
}
