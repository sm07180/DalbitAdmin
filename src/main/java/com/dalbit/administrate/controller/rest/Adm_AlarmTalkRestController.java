package com.dalbit.administrate.controller.rest;

import com.dalbit.administrate.service.Adm_AlarmTalkService;
import com.dalbit.administrate.vo.procedure.P_AlarmTalkLogListInputVo;
import com.dalbit.administrate.vo.procedure.P_AlarmTalkTargetEditVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.inforex.vo.InforexMember;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/rest/administrate/alarmtalk")
public class Adm_AlarmTalkRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    CommonService commonService;
    @Autowired
    Adm_AlarmTalkService admAlarmTalkService;

    @PostMapping("/list")
    public String list(SearchVo searchVo) {
        List<InforexMember> memberList = admAlarmTalkService.callAlarmTalkTargetList(searchVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, memberList));
    }


    @PostMapping("/edit")
    public String edit(P_AlarmTalkTargetEditVo pAlarmTalkTargetEditVo, HttpServletRequest request) throws GlobalException{
        admAlarmTalkService.targetEdit(pAlarmTalkTargetEditVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.알림톡대상조회_성공));
    }

    @PostMapping("/logs")
    public String logs(P_AlarmTalkLogListInputVo pAlarmTalkLogListInputVo, HttpServletRequest request) throws  GlobalException{
        return admAlarmTalkService.callAlarmTalkLogList(pAlarmTalkLogListInputVo);
    }
}
