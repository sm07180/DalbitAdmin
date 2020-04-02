package com.dalbit.administrate.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.inforex.vo.InforexDutyCode;
import com.dalbit.inforex.vo.InforexMember;
import com.dalbit.inforex.vo.InforexPosCode;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.InforexApiUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/rest/administrate/authority")
public class Adm_AuthorityRestController {

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("/list")
    public String list(SearchVo searchVo) {
        InforexPosCode[] inforexPosCodes = InforexApiUtil.getInforexPosCode();
        InforexDutyCode[] inforexDutyCode = InforexApiUtil.getInforexDutyCode();
        InforexMember[] inforexMembers = InforexApiUtil.getInforexMemberList();

        //직급, 직책 이름 매칭
        Arrays.stream(inforexMembers).forEach(member -> {
            member.setStaff_pos_name(Arrays.stream(inforexPosCodes).filter(inforexPosCode -> inforexPosCode.getPos_code().equals(member.getStaff_pos())).findFirst().get().getPos_name());
            member.setStaff_duty_name(Arrays.stream(inforexDutyCode).filter(inforexPosCode -> inforexPosCode.getDuty_code().equals(member.getStaff_duty())).findFirst().get().getDuty_name());
        });

        List<InforexMember> memberList = Arrays.asList(inforexMembers);
        //검색
        if(!DalbitUtil.isEmpty(searchVo.getPosType())){
            memberList = memberList.stream()
                .filter(inforexMember -> inforexMember.getStaff_pos().equals(searchVo.getPosType()))
                .collect(Collectors.toList());
        }

        if(!DalbitUtil.isEmpty(searchVo.getDeptType())){
            memberList = memberList.stream()
                .filter(inforexMember -> inforexMember.getDept_no().equals(searchVo.getDeptType()))
                .collect(Collectors.toList());
        }

        if(!DalbitUtil.isEmpty(searchVo.getSearchText())){
            memberList = memberList.stream()
                .filter(inforexMember -> inforexMember.getStaff_name().equals(searchVo.getSearchText()))
                .collect(Collectors.toList());
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, memberList));
    }
}
