package com.dalbit.content.service;

import com.dalbit.common.code.EventCode;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.dao.Con_EventDao;
import com.dalbit.content.vo.*;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.menu.vo.SpecialReqVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Slf4j
@Service
public class Con_EventService {

    @Autowired
    ExcelService excelService;
    @Autowired
    Con_EventDao con_EventDao;
    @Autowired
    Mem_MemberDao memMemberDao;
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
                outVo.setMem_birth_year(eventMemberList.get(i).getMem_birth_year());
                outVo.setMem_birth_month(eventMemberList.get(i).getMem_birth_month());
                outVo.setMem_birth_day(eventMemberList.get(i).getMem_birth_day());
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


    /**
     * 이벤트 댓글 리스트
     */
    public String getEventReplyList(P_EventReplyListInputVo pEventReplyListInputVo) {
        int totalCnt = con_EventDao.callEventReplyList_totalCnt(pEventReplyListInputVo);
        ArrayList<P_EventReplyListOutputVo> eventReplyList = con_EventDao.callEventReplyList(pEventReplyListInputVo);

        String result;
        if(eventReplyList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트중복응모자목록보기_성공, eventReplyList, new PagingVo(totalCnt)));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트중복응모자목록보기_실패));
        }
        return result;
    }

    /**
     * 이벤트 댓글 삭제
     */
    public String getEventReplyDelete(P_EventReplyDeleteInputVo pEventReplyDeleteInputVo) {
        String result;
        pEventReplyDeleteInputVo.setOpName(MemberVo.getMyMemNo());
        int delResult =con_EventDao.callEventReplyDelete(pEventReplyDeleteInputVo);
        if(delResult > 0){
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트댓글삭제성공));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트댓글삭제실패));
        }

        return result;
    }

    /*======================= 출석 체크 이벤트 ======================= */

    /**
     * 출석 이벤트 리스트 조회
     */
    public String selectAttendanceList(AttendanceVo attendanceVo) {
        List<AttendanceVo> list = con_EventDao.selectAttendanceList(attendanceVo);
        int totalCnt = con_EventDao.selectAttendanceListCnt(attendanceVo);
        attendanceVo.setTotalCnt(totalCnt);

        for(int i=0; i<list.size(); i++) {
            MemberVo outVo = memMemberDao.getMemberInfo(list.get(i).getMem_no());
            if(!DalbitUtil.isEmpty(outVo)) {
                list.get(i).setMem_sex(outVo.getMem_sex());
                list.get(i).setMem_birth_year(outVo.getMem_birth_year());
                list.get(i).setMem_birth_month(outVo.getMem_birth_month());
                list.get(i).setMem_birth_day(outVo.getMem_birth_day());
            }
        }

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(attendanceVo.getTotalCnt(), attendanceVo.getPageStart(), attendanceVo.getPageCnt())));

        return result;
    }

    public String selectAttendanceCalendarList(AttendanceCalendarVo attendanceCalendarVo){
        List<AttendanceCalendarVo> attendanceCalendarList = con_EventDao.selectAttendanceCalendarList(attendanceCalendarVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, attendanceCalendarList));
    }

    public String selectAttendanceWeekCalendarList(AttendanceCalendarVo attendanceCalendarVo){
        AttendanceCalendarVo weekAttendanceCalendarVo = con_EventDao.selectAttendanceWeekCalendarList(attendanceCalendarVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, weekAttendanceCalendarVo));
    }

    public String selectAttendanceBonus(AttendanceBonusVo attendanceBonusVo){
        AttendanceBonusVo resultBonusVo = con_EventDao.selectAttendanceBonus(attendanceBonusVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultBonusVo));
    }

    public String selectGiftconList(AttendanceGiftconVo attendanceGiftconVo){
        List<AttendanceGiftconVo> giftconList = con_EventDao.selectGiftconList(attendanceGiftconVo);
        int totalCnt = con_EventDao.selectGiftconCnt(attendanceGiftconVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, giftconList, new PagingVo(totalCnt)));
    }

    public String selectPhotoShotList(PhotoShotVo photoShotVo){
        photoShotVo.setEvent_idx(EventCode.인증샷.getEventIdx());

        int totalCnt = con_EventDao.selectPhotoShotCnt(photoShotVo);
        photoShotVo.setTotalCnt(totalCnt);
        List<PhotoShotVo> giftconList = con_EventDao.selectPhotoShotList(photoShotVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, giftconList, new PagingVo(totalCnt)));
    }

    public Model getPhotoListExcel(PhotoShotVo photoShotVo, Model model) {
        photoShotVo.setPageCnt(1000000);

        List<PhotoShotVo> list = con_EventDao.selectPhotoShotList(photoShotVo);

        String[] headers = {"No", "회원번호", "UID", "닉네임", "참여일시"};
        int[] headerWidths = {3000, 5000, 5000, 6000, 6000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i=0; i<list.size(); i++) {
            HashMap hm = new LinkedHashMap();

            hm.put("no", list.size()-i);
            hm.put("mem_no", DalbitUtil.isEmpty(list.get(i).getMem_no()) ? "" : list.get(i).getMem_no());
            hm.put("mem_userid", DalbitUtil.isEmpty(list.get(i).getMem_userid()) ? "" : list.get(i).getMem_userid());
            hm.put("mem_nick", DalbitUtil.isEmpty(list.get(i).getMem_nick()) ? "" : list.get(i).getMem_nick());
            hm.put("reg_date", DalbitUtil.isEmpty(list.get(i).getReg_date()) ? "" : list.get(i).getReg_date());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("인증샷이벤트 신청 목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "인증샷이벤트 신청 목록");

        return model;
    }

    public String deletePhotoShot(PhotoShotVo photoShotVo){
        photoShotVo.setEvent_idx(EventCode.인증샷.getEventIdx());
        photoShotVo.setIdxArr(photoShotVo.getIdxs().split(","));
        photoShotVo.setDel_yn(1);
        photoShotVo.setOpName(MemberVo.getMyMemNo());

        int deleteMemCnt = con_EventDao.deleteEventMember(photoShotVo);
        int deletePhotoCnt = con_EventDao.deletePhotoShot(photoShotVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.삭제));
    }
}
