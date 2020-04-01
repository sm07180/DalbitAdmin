package com.dalbit.administrate.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.inforex.vo.InforexMember;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.InforexApiUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/rest/administrate/authority")
public class Adm_AuthorityRestController {

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("/list")
    public String list() {
        InforexMember[] inforexMembers = InforexApiUtil.getInforexMemberList();
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, inforexMembers));
    }
}
