package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_CrewService;
import com.dalbit.content.vo.CrewInsertVo;
import com.dalbit.content.vo.CrewListVo;
import com.dalbit.content.vo.CrewMemberInsertVo;
import com.dalbit.content.vo.CrewMemberListVo;
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
     * 크루명 등록
     */
    @PostMapping("/insertCrewName")
    public String insertCrewName(CrewInsertVo crewInsertVo) {
        return crewService.insertCrewName(crewInsertVo);
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
}
