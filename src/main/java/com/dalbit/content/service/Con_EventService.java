package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.dao.Con_EventDao;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class Con_EventService {

    @Autowired
    Con_EventDao con_EventDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 이벤트 목록
     */
    public String getEventList(P_EventListInputVo pEventListInputVo){
        ArrayList<P_EventListOutputVo> eventList = null;
        int totalCnt;

        pEventListInputVo.setPageNo(pEventListInputVo.getPageNo() -1);
        pEventListInputVo.setPageNo(pEventListInputVo.getPageNo() * pEventListInputVo.getPageCnt());

        if(pEventListInputVo.getState() == 0) {
            eventList = con_EventDao.callEventList(pEventListInputVo);
            totalCnt = con_EventDao.callEventList_totalCnt(pEventListInputVo);
        }else {
            eventList = con_EventDao.callEventList_End(pEventListInputVo);
            totalCnt = con_EventDao.callEventList_End_totalCnt(pEventListInputVo);
        }

        String result;
        if(eventList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트목록보기_성공, eventList, new PagingVo(totalCnt)));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트목록보기_실패));
        }
        return result;
    }

    /**
     * 이벤트 등록
     */
    public String setEventDelete(P_EventDeleteVo pEventDeleteVo){
        String result;
        pEventDeleteVo.setOpName(MemberVo.getMyMemNo());
        con_EventDao.callEventDelete(pEventDeleteVo);
        con_EventDao.callEventMemberDelete(pEventDeleteVo);
        result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트삭제성공));

        return result;
    }

    /**
     * 이벤트 등록
     */
    public String setEventInsert(P_EventUpdateVo pEventUpdateVo){
        String result;
        pEventUpdateVo.setOpName(MemberVo.getMyMemNo());
        con_EventDao.callEventInsert(pEventUpdateVo);
        result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트등록성공));

        return result;
    }

    /**
     * 이벤트 수정
     */
    public String setEventUpdate(P_EventUpdateVo pEventUpdateVo){
        String result;
        pEventUpdateVo.setOpName(MemberVo.getMyMemNo());
        con_EventDao.callEventUpdate(pEventUpdateVo);
        result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트수정성공));

        return result;
    }

    /**
     * 이벤트 응모자 목록
     */
    public String getEventMemberList(P_EventMemberListInputVo pEventMemberListInputVo){
        pEventMemberListInputVo.setPageNo(pEventMemberListInputVo.getPageNo() -1);
        pEventMemberListInputVo.setPageNo(pEventMemberListInputVo.getPageNo() * pEventMemberListInputVo.getPageCnt());

        ArrayList<P_EventMemberListOutputVo> eventMemberList = con_EventDao.callEventMemberList(pEventMemberListInputVo);
        int totalCnt = con_EventDao.callEventMemberList_totalCnt(pEventMemberListInputVo);
        int winCnt;

        int maleCnt =0;
        int femaleCnt =0;
        int maleWinCnt =0;
        int femaleWinCnt =0;
        int overlapCnt =0;

        List list = new ArrayList();
        if(!DalbitUtil.isEmpty(eventMemberList)) {
            for (int i = 0; i < eventMemberList.size(); i++) {
                winCnt = con_EventDao.callEventMemberList_winCnt(eventMemberList.get(i).getMem_no());
                P_EventMemberListOutputVo outVo = new P_EventMemberListOutputVo();
                outVo.setRowNum(eventMemberList.get(i).getRowNum());
                outVo.setEvent_idx(eventMemberList.get(i).getEvent_idx());
                outVo.setMem_no(eventMemberList.get(i).getMem_no());
                outVo.setIs_win(eventMemberList.get(i).getIs_win());
                outVo.setOrder(eventMemberList.get(i).getOrder());
                outVo.setMem_userid(eventMemberList.get(i).getMem_userid());
                outVo.setMem_nick(eventMemberList.get(i).getMem_nick());
                outVo.setMem_sex(eventMemberList.get(i).getMem_sex());
                outVo.setMem_phone(eventMemberList.get(i).getMem_phone());
                outVo.setListenCnt(eventMemberList.get(i).getListenCnt());
                outVo.setBroadCnt(eventMemberList.get(i).getBroadCnt());
                outVo.setGiftCnt(eventMemberList.get(i).getGiftCnt());
                outVo.setApplyCnt(eventMemberList.get(i).getApplyCnt());
                outVo.setWinCnt(winCnt);
                list.add(outVo);

                if(eventMemberList.get(i).getMem_sex().equals("m")){
                    maleCnt++;
                    if(eventMemberList.get(i).getIs_win() == 1){
                        maleWinCnt++;
                    }
                }else{
                    femaleCnt++;
                    if(eventMemberList.get(i).getIs_win() == 1){
                        femaleWinCnt++;
                    }
                }
                if(eventMemberList.get(i).getApplyCnt() > 1){
                    overlapCnt++;
                }
            }
        }

        P_EventMemberListOutputVo summary = new P_EventMemberListOutputVo();
        summary.setMaleCnt(maleCnt);
        summary.setMaleWinCnt(maleWinCnt);
        summary.setFemaleCnt(femaleCnt);
        summary.setFemaleWinCnt(femaleWinCnt);
        summary.setOverlapCnt(overlapCnt);


        String result;
        if(eventMemberList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트응모자목록보기_성공, list, new PagingVo(totalCnt),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트응모자목록보기_실패));
        }
        return result;
    }


    /**
     * 이벤트 응모자 선정
     */
    public String getEventMemberSelWin(P_EventMemberSelWinVo pEventMemberSelWinVo){
        pEventMemberSelWinVo.setOpName(MemberVo.getMyMemNo());
        con_EventDao.callEventSelWIn(pEventMemberSelWinVo);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트응모자선정_성공));
        return result;
    }

    /**
     * 이벤트 중복 응모자 목록
     */
    public String getEventOverlapApplyList(P_EventMemberListInputVo pEventMemberListInputVo){
        ArrayList<P_EventMemberListOutputVo> eventOverlapApplyList = con_EventDao.callEventOverlapApplyList(pEventMemberListInputVo);

        String result;
        if(eventOverlapApplyList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트중복응모자목록보기_성공, eventOverlapApplyList));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트중복응모자목록보기_실패));
        }
        return result;
    }



}
