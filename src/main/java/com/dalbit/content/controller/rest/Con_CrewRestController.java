package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_CrewService;
import com.dalbit.content.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/rest/content/crew")
public class Con_CrewRestController {

    @Autowired
    Con_CrewService crewService;

    /**
     * 크루 등록
     */
    @PostMapping("/insertCrewName")
    public String insertCrewName(CrewInsertVo crewInsertVo) {
        return crewService.insertCrewName(crewInsertVo);
    }

    /**
     * 크루명 수정
     */
    @PostMapping("/updateCrewMemo")
    public String updateCrewMemo(CrewUpdateVo crewUpdateVo) {
        return crewService.updateCrewMemo(crewUpdateVo);
    }

    /**
     * 크루명 조회
     */
    @PostMapping("/selectCrewInfo")
    public String selectCrewInfo(CrewListVo crewListVo) {
        return crewService.selectCrewInfo(crewListVo);
    }

    /**
     * 크루원 등록
     */
    @PostMapping("/insertCrewMember")
    public String insertCrewMember(CrewMemberInsertVo crewMemberInsertVo) {
        return crewService.insertCrewMember(crewMemberInsertVo);
    }

    /**
     * 크루원 조회
     */
    @PostMapping("/selectCrewMemberInfo")
    public String selectCrewMemberInfo(CrewMemberListVo crewMemberListVo) {
        return crewService.selectCrewMemberInfo(crewMemberListVo);
    }

    /**
     * 크루장 지정
     */
    @PostMapping("/updateCrewLeader")
    public String updateCrewLeader(CrewMemberInsertVo crewMemberInsertVo) {
        return crewService.updateCrewLeader(crewMemberInsertVo);
    }

    /**
     * 크루 삭제
     */
    @PostMapping("/updateDelStateCrew")
    public String updateDelStateCrew(CrewUpdateDelStateVo crewUpdateDelStateVo) {
        return crewService.updateDelStateCrew(crewUpdateDelStateVo);
    }

    /**
     * 크루원 삭제
     */
    @PostMapping("/deleteCrewMember")
    public String deleteCrewMember(CrewMemberDeleteVo crewMemberDeleteVo) {
        return crewService.deleteCrewMember(crewMemberDeleteVo);
    }
}
