package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.proc.Event_InviteProc;
import com.dalbit.content.proc.Event_welcomeProc;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Con_InviteEventService {
    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Event_InviteProc event_inviteProc;

    /**
     * 초대현황
     * @return
     */
    public String callInviteState(P_InviteInputVo pInviteInputVo) {
        List<P_InviteStateOutputVo> list = event_inviteProc.getInviteState(pInviteInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 참여자목록
     * @return
     */
    public String callInviteList(P_InviteInputVo pInviteInputVo) {
        List<Object> getList = event_inviteProc.getInviteList(pInviteInputVo);
        int listCnt = DBUtil.getData(getList, Integer.class);
        List<P_InviteListOutputVo> list = DBUtil.getList(getList, P_InviteListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 초대목록
     * @return
     */
    public String callInviteRecvList(P_InviteInputVo pInviteInputVo) {
        List<Object> getList = event_inviteProc.getInviteRecvList(pInviteInputVo);
        int listCnt = DBUtil.getData(getList, Integer.class);
        List<P_InviteRecvListOutputVo> list = DBUtil.getList(getList, P_InviteRecvListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }
}
