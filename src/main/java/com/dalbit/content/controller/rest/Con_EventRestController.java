package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.service.Con_EventService;
import com.dalbit.content.vo.EventVo;
import com.dalbit.content.vo.procedure.P_EventListInputVo;
import com.dalbit.content.vo.procedure.P_EventMemberListInputVo;
import com.dalbit.content.vo.procedure.P_EventMemberSelWinVo;
import com.dalbit.content.vo.procedure.P_EventUpdateVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;

@Slf4j
@RestController
@RequestMapping("rest/content/event")
public class Con_EventRestController {

    @Autowired
    Con_EventService con_EventService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 이벤트 목록
     */
    @PostMapping("list")
    public String list(P_EventListInputVo pEventListInputVo){
        String result = con_EventService.getEventList(pEventListInputVo);
        return result;
    }

    /**
     * 이벤트 등록
     */
    @PostMapping("eventInsert")
    public String eventInsert(P_EventUpdateVo pEventUpdateVo){
        String result = con_EventService.setEventInsert(pEventUpdateVo);
        return result;
    }

    /**
     * 이벤트 수정
     */
    @PostMapping("eventUpdate")
    public String eventUpdate(P_EventUpdateVo pEventUpdateVo){
        String result = con_EventService.setEventUpdate(pEventUpdateVo);
        return result;
    }

    /**
     * 이벤트 응모자 목록
     */
    @PostMapping("memberList")
    public String memberList(P_EventMemberListInputVo pEventMemberListInputVo){
        String result = con_EventService.getEventMemberList(pEventMemberListInputVo);
        return result;
    }

    /**
     * 이벤트 선택당첨
     */
    @PostMapping("memberSelWin")
    public String memberSelWin(P_EventMemberSelWinVo pEventMemberSelWinVo){
        String result="";
        if(pEventMemberSelWinVo.getChoiceNum() != 0) {
            result = con_EventService.getEventMemberSelWin(pEventMemberSelWinVo);
        }
        return result;
    }

    /**
     * 이벤트 중복 응모자 목록
     */
    @PostMapping("overlapApplyList")
    public String overlapApplyList(P_EventMemberListInputVo pEventMemberListInputVo){
        String result = con_EventService.getEventOverlapApplyList(pEventMemberListInputVo);
        return result;
    }

}
