package com.dalbit.content.service;

import com.dalbit.common.code.EventCode;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.Con_EventDao;
import com.dalbit.content.vo.*;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;
import java.util.List;

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

        int totalCnt = con_EventDao.selectPhotoShotCnt(photoShotVo);
        photoShotVo.setTotalCnt(totalCnt);
        List<PhotoShotVo> giftconList = con_EventDao.selectPhotoShotList(photoShotVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, giftconList, new PagingVo(totalCnt)));
    }

    public String selectPhotoShotDetail(PhotoShotVo photoShotVo){

        photoShotVo.setTotalCnt(1);
        photoShotVo.setSearchStartNo(1);
        photoShotVo.setSearchEndNo(1);
        List<PhotoShotVo> giftconList = con_EventDao.selectPhotoShotList(photoShotVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, giftconList.get(0)));
    }

    public Model getPhotoListExcel(PhotoShotVo photoShotVo, Model model) {
        photoShotVo.setTotalCnt(1000000);
        photoShotVo.setEvent_idx(EventCode.인증샷.getEventIdx());
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
        photoShotVo.setIdxArr(photoShotVo.getIdxs().split(","));
        photoShotVo.setDel_yn(1);
        photoShotVo.setOpName(MemberVo.getMyMemNo());

        int deleteMemCnt = con_EventDao.deleteEventMember(photoShotVo);
        int deletePhotoCnt = con_EventDao.deletePhotoShot(photoShotVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.삭제));
    }

    public Model getKnowhowListExcel(PhotoShotVo photoShotVo, Model model) {
        photoShotVo.setTotalCnt(1000000);
        photoShotVo.setEvent_idx(EventCode.노하우.getEventIdx());
        List<PhotoShotVo> list = con_EventDao.selectPhotoShotList(photoShotVo);

        String[] headers = {"No", "회원번호", "UID", "닉네임", "참여일시"
                , "추천수", "조회수", "구분", "디바이스", "기종1"
                , "기종2", "채택여부"};
        int[] headerWidths = {3000, 5000, 5000, 6000, 6000
                , 3000, 3000, 5000, 5000, 8000
                , 8000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i=0; i<list.size(); i++) {
            HashMap hm = new LinkedHashMap();

            hm.put("no", list.size()-i);
            hm.put("mem_no", DalbitUtil.isEmpty(list.get(i).getMem_no()) ? "" : list.get(i).getMem_no());
            hm.put("mem_userid", DalbitUtil.isEmpty(list.get(i).getMem_userid()) ? "" : list.get(i).getMem_userid());
            hm.put("mem_nick", DalbitUtil.isEmpty(list.get(i).getMem_nick()) ? "" : list.get(i).getMem_nick());
            hm.put("reg_date", DalbitUtil.isEmpty(list.get(i).getReg_date()) ? "" : list.get(i).getReg_date());
            hm.put("good_cnt", DalbitUtil.isEmpty(list.get(i).getGood_cnt()) ? "" : list.get(i).getGood_cnt());
            hm.put("view_cnt", DalbitUtil.isEmpty(list.get(i).getView_cnt()) ? "" : list.get(i).getView_cnt());

            String slct_device = "mobile";
            if(list.get(i).getSlct_device() < 3){
                slct_device = "pc";
            }
            hm.put("slct_device", slct_device);
            hm.put("device1", DalbitUtil.isEmpty(list.get(i).getDevice1()) ? "" : list.get(i).getDevice1());
            hm.put("device2", DalbitUtil.isEmpty(list.get(i).getDevice2()) ? "" : list.get(i).getDevice2());
            hm.put("is_check", list.get(i).getIs_check() == 0 ? "N" : "Y");

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("노하우이벤트 신청 목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "노하우이벤트 신청 목록");

        return model;
    }

    public String updatePhotoGood(PhotoShotVo photoShotVo){
        photoShotVo.setOpName(MemberVo.getMyMemNo());
        int goodResult = con_EventDao.updatePhotoGood(photoShotVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.수정, goodResult));
    }

    public String selectEventMemberList(EventMemberVo eventMemberVo){
        int totalCnt = con_EventDao.selectEventMemberCnt(eventMemberVo);
        eventMemberVo.setTotalCnt(totalCnt);
        List<EventMemberVo> list = con_EventDao.selectEventMemberList(eventMemberVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(totalCnt)));
    }

    public Model getEventMemberListExcel(EventMemberVo eventMemberVo, Model model) {
        eventMemberVo.setTotalCnt(1000000);
        eventMemberVo.setEvent_idx(EventCode.방송장비.getEventIdx());
        List<EventMemberVo> list = con_EventDao.selectEventMemberList(eventMemberVo);

        String[] headers = {"No", "회원번호", "닉네임", "신청일", "이름", "연락처", "방송소개"};
        int[] headerWidths = {3000, 5000, 5000, 6000, 6000, 10000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i=0; i<list.size(); i++) {
            HashMap hm = new LinkedHashMap();

            hm.put("no", list.size()-i);
            hm.put("mem_no", DalbitUtil.isEmpty(list.get(i).getMem_no()) ? "" : list.get(i).getMem_no());
            hm.put("mem_nick", DalbitUtil.isEmpty(list.get(i).getMem_nick()) ? "" : list.get(i).getMem_nick());
            hm.put("reg_date", DalbitUtil.isEmpty(list.get(i).getReg_date()) ? "" : list.get(i).getReg_date());
            hm.put("name", DalbitUtil.isEmpty(list.get(i).getName()) ? "" : list.get(i).getName());
            hm.put("contact_no", DalbitUtil.isEmpty(list.get(i).getContact_no()) ? "" : list.get(i).getContact_no());
            hm.put("recv_data_1", DalbitUtil.isEmpty(list.get(i).getRecv_data_1()) ? "" : list.get(i).getRecv_data_1());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("방송지원 신청 목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "방송지원 신청 목록");

        return model;
    }

    /*======================= 이벤트 관리 =======================*/

    /**
     * 이벤트 리스트 조회
     */
    public String callEventManagementList(P_EventManagementListInputVo pEventManagementListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pEventManagementListInputVo);
        ArrayList<P_EventManagementListOutputVo> eventList = con_EventDao.callEventManagementList(procedureVo);

        String result;
        if(Integer.parseInt(procedureVo.getRet())> 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_리스트조회_성공, eventList, new PagingVo(procedureVo.getRet())));
        } else if(Status.이벤트관리_리스트조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_리스트조회_데이터없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_리스트조회_실패));
        }

        return result;
    }

    /**
     * 이벤트 상세 정보
     */
    public String callEventManagementInfo(P_EventManagementInfoInputVo pEventManagementInfoInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pEventManagementInfoInputVo);
        con_EventDao.callEventManagementInfo(procedureVo);
        P_EventManagementInfoOutputVo eventInfo = new Gson().fromJson(procedureVo.getExt(), P_EventManagementInfoOutputVo.class);

        String result;
        if(Status.이벤트관리_상세정보조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_상세정보조회_성공, eventInfo));
        } else if(Status.이벤트관리_상세정보조회_이벤트번호없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_상세정보조회_이벤트번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_상세정보조회_실패));
        }
        return result;
    }

    /**
     * 이벤트 등록
     */
    public String callEventManagementAdd(P_EventManagementAddVo pEventManagementAddVo) {
        pEventManagementAddVo.setOpName(MemberVo.getMyMemNo());

        if(pEventManagementAddVo.getAlwaysYn() == 1){
            pEventManagementAddVo.setEndDate("0000-00-00 00:00:00");
        }
        ProcedureVo procedureVo = new ProcedureVo(pEventManagementAddVo);

        con_EventDao.callEventManagementAdd(procedureVo);

        String result;
        if(Status.이벤트관리_이벤트등록_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_이벤트등록_성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_이벤트등록_실패));
        }

        return result;
    }

    /**
     * 이벤트 수정
     */
    public String callEventManagementEdit(P_EventManagementEditVo pEventManagementEditVo) {
        pEventManagementEditVo.setOpName(MemberVo.getMyMemNo());

        if(pEventManagementEditVo.getAlwaysYn() == 1) {
            pEventManagementEditVo.setEndDate("0000-00-00 00:00:00");
        }

        ProcedureVo procedureVo = new ProcedureVo(pEventManagementEditVo);

        con_EventDao.callEventManagementEdit(procedureVo);

        String result;
        if(Status.이벤트관리_이벤트수정_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_이벤트수정_성공));
        } else if(Status.이벤트관리_이벤트수정_이벤트번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_이벤트수정_이벤트번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_이벤트수정_실패));
        }

        return result;
    }

    /**
     * 이벤트 삭제
     */
    public String callEventManagementDelete(P_EventManagementDeleteVo pEventManagementDeleteVo) {

        String result = "";

        if(!DalbitUtil.isEmpty(pEventManagementDeleteVo.getEventIdx())) {
            int sucCnt = 0;
            int failCnt = 0;

            String[] idxs = pEventManagementDeleteVo.getEventIdx().split(",");
            for (String eventIdx : idxs) {
                if (NumberUtils.isDigits(eventIdx)) {
                    ProcedureVo procedureVo = new ProcedureVo(new P_EventManagementDeleteVo(eventIdx, MemberVo.getMyMemNo()));

                    con_EventDao.callEventManagementDelete(procedureVo);

                    if (Status.이벤트관리_이벤트삭제_성공.getMessageCode().equals(procedureVo.getRet())) {
                        sucCnt++;
                    } else {
                        failCnt++;
                    }
                }
            }

            HashMap resultMap = new HashMap();
            resultMap.put("sucCnt", sucCnt);
            resultMap.put("failCnt", failCnt);

            if (0 < sucCnt) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_이벤트삭제_성공, resultMap));
            } else {
                result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_이벤트삭제_실패, resultMap));
            }
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_이벤트삭제_파라미터오류));
        }
        return result;
    }

    /**
     * 경품 리스트 조회
     */
    public String callEventPrizeList(P_EventPrizeListInputVo pEventPrizeListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pEventPrizeListInputVo);
        ArrayList<P_EventPrizeListOutputVo> prizeList = con_EventDao.callEventPrizeList(procedureVo);

        String result;
        if(Integer.parseInt(procedureVo.getRet())> 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품리스트조회_성공, prizeList, new PagingVo(procedureVo.getRet())));
        } else if(Status.이벤트관리_경품리스트조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품리스트조회_데이터없음));
        } else if(Status.이벤트관리_경품리스트조회_이벤트번호없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품리스트조회_이벤트번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품리스트조회_실패));
        }

        return result;
    }

    /**
     * 경품 등록
     */
    public String callEventPrizeAdd(P_EventPrizeAddVo pEventPrizeAddVo) {
        pEventPrizeAddVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pEventPrizeAddVo);

        con_EventDao.callEventPrizeAdd(procedureVo);

        String result;
        if(Status.이벤트관리_경품등록_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품등록_성공));
        } else if(Status.이벤트관리_경품등록_이벤트번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품등록_이벤트번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품등록_실패));
        }

        return result;
    }

    /**
     * 경품 상세 조회
     */
    public String callEventPrizeDetail(P_EventPrizeDetailInputVo pEventPrizeDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pEventPrizeDetailInputVo);
        con_EventDao.callEventPrizeDetail(procedureVo);
        P_EventPrizeDetailOutputVo prizeDetail = new Gson().fromJson(procedureVo.getExt(), P_EventPrizeDetailOutputVo.class);

        String result;

        if(Status.이벤트관리_경품상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품상세조회_성공, prizeDetail));
        } else if(Status.이벤트관리_경품상세조회_이벤트번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품상세조회_이벤트번호없음));
        } else if(Status.이벤트관리_경품상세조회_경품번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품상세조회_경품번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품상세조회_실패));
        }
        return result;
    }

    /**
     * 경품 수정
     */
    public String callEventPrizeEdit(P_EventPrizeEditVo pEventPrizeEditVo) {
        pEventPrizeEditVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pEventPrizeEditVo);

        con_EventDao.callEventPrizeEdit(procedureVo);

        String result;
        if(Status.이벤트관리_경품수정_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품수정_성공));
        } else if(Status.이벤트관리_경품수정_이벤트번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품수정_이벤트번호없음));
        } else if(Status.이벤트관리_경품수정_경품번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품수정_경품번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품수정_실패));
        }

        return result;
    }

    /**
     * 경품 삭제
     */
    public String callEventPrizeDelete(P_EventPrizeDeleteVo pEventPrizeDeleteVo) {
        int sucCnt = 0;
        int failCnt = 0;

        String result;

        String[] idxs = pEventPrizeDeleteVo.getPrizeIdxs().split(",");
        for(int i=0; i<idxs.length; i++) {
            if(!DalbitUtil.isEmpty(pEventPrizeDeleteVo.getPrizeIdxs())) {
                ProcedureVo procedureVo = new ProcedureVo(new P_EventPrizeDeleteVo(idxs[i], pEventPrizeDeleteVo.getEventIdx(), MemberVo.getMyMemNo()));
                con_EventDao.callEventPrizeDelete(procedureVo);

                if(Status.이벤트관리_경품삭제_성공.getMessageCode().equals(procedureVo.getRet())) {
                    sucCnt++;
                } else {
                    failCnt++;
                }
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품삭제_성공, resultMap));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_경품삭제_실패, resultMap));
        }
        return result;
    }

    /**
     * 응모자/당첨자 정보
     */
    public String callEventWinnerInfo(P_EventWinnerInfoInputVo pEventWinnerInfoInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pEventWinnerInfoInputVo);
        ArrayList<P_EventWinnerInfoOutputVo> infoList = con_EventDao.callEventWinnerInfo(procedureVo);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_응모자당첨자정보조회_성공, infoList));
        } else if(Status.이벤트관리_응모자당첨자정보조회_리스트없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_응모자당첨자정보조회_리스트없음));
        } else if(Status.이벤트관리_응모자당첨자정보조회_이벤트번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_응모자당첨자정보조회_이벤트번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_응모자당첨자정보조회_실패));
        }

        return result;
    }

    /**
     * 응모자/당첨자 리스트 조회
     */
    public String callEventWinnerApplicant(P_EventWinnerApplicantInputVo pEventWinnerApplicantInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pEventWinnerApplicantInputVo);
        ArrayList<P_EventWinnerApplicantOutputVo> ApplicantList = con_EventDao.callEventWinnerApplicant(procedureVo);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_응모자당첨자리스트조회_성공, ApplicantList, new PagingVo(procedureVo.getRet())));
        } else if(Status.이벤트관리_응모자당첨자리스트조회_리스트없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_응모자당첨자리스트조회_리스트없음));
        } else if(Status.이벤트관리_응모자당첨자리스트조회_이벤트번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_응모자당첨자리스트조회_이벤트번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_응모자당첨자리스트조회_실패));
        }

        return result;
    }

    /**
     * 당첨자 리스트 조회
     */
    public String callEventWinnerList(P_EventWinnerListInputVo pEventWinnerListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pEventWinnerListInputVo);
        ArrayList<P_EventWinnerListOutputVo> WinnerList = con_EventDao.callEventWinnerList(procedureVo);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자리스트조회_성공, WinnerList, new PagingVo(procedureVo.getRet())));
        } else if(Status.이벤트관리_당첨자리스트조회_리스트없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자리스트조회_리스트없음));
        } else if(Status.이벤트관리_당첨자리스트조회_이벤트번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자리스트조회_이벤트번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자리스트조회_실패));
        }

        return result;
    }

    /**
     * 당첨자 추가
     */
    public String callEventWinnerAdd(P_EventWinnerAddVo pEventWinnerAddVo) {
        pEventWinnerAddVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pEventWinnerAddVo);
        con_EventDao.callEventWinnerAdd(procedureVo);

        String result;
        if(Status.이벤트관리_당첨자추가_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자추가_성공));
        } else if(Status.이벤트관리_당첨자추가_실패.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자추가_실패));
        } else if(Status.이벤트관리_당첨자추가_이벤트번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자추가_이벤트번호없음));
        } else if(Status.이벤트관리_당첨자추가_경품번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자추가_경품번호없음));
        } else if(Status.이벤트관리_당첨자추가_당첨인원초과.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자추가_당첨인원초과));
        } else if (Status.이벤트관리_당첨자추가_응모자리스트없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자추가_응모자리스트없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자추가_당첨자선정완료후추가안됨));
        }
        return result;
    }

    /**
     * 당첨자 취소
     */
    public String callEventWinnerDelete(P_EventWinnerDeleteVo pEventWinnerDeleteVo) {
        pEventWinnerDeleteVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pEventWinnerDeleteVo);
        con_EventDao.callEventWinnerDelete(procedureVo);

        String result;
        if(Status.이벤트관리_당첨자취소_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자취소_성공));
        } else if(Status.이벤트관리_당첨자취소_실패.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자취소_실패));
        } else if(Status.이벤트관리_당첨자취소_이벤트번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자취소_이벤트번호없음));
        } else if(Status.이벤트관리_당첨자취소_당첨자번호리스트없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자취소_당첨자번호리스트없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트관리_당첨자취소_당첨자선정완료후삭제안됨));
        }
        return result;
    }

    /*======================= 기존 이벤트 관리 ======================= */
//    /**
//     * 이벤트 목록
//     */
//    public String getEventList(P_EventListInputVo pEventListInputVo){
//        ArrayList<P_EventListOutputVo> eventList = null;
//        int totalCnt;
//
//        pEventListInputVo.setPageNo(pEventListInputVo.getPageNo() -1);
//        pEventListInputVo.setPageNo(pEventListInputVo.getPageNo() * pEventListInputVo.getPageCnt());
//
//        if(pEventListInputVo.getState() == 0) {
//            eventList = con_EventDao.callEventList(pEventListInputVo);
//            totalCnt = con_EventDao.callEventList_totalCnt(pEventListInputVo);
//        }else {
//            eventList = con_EventDao.callEventList_End(pEventListInputVo);
//            totalCnt = con_EventDao.callEventList_End_totalCnt(pEventListInputVo);
//        }
//
//        String result;
//        if(eventList.size() > 0) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트목록보기_성공, eventList, new PagingVo(totalCnt)));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트목록보기_실패));
//        }
//        return result;
//    }
//
//    /**
//     * 이벤트 등록
//     */
//    public String setEventDelete(P_EventDeleteVo pEventDeleteVo){
//        String result;
//        pEventDeleteVo.setOpName(MemberVo.getMyMemNo());
//        con_EventDao.callEventDelete(pEventDeleteVo);
//        con_EventDao.callEventMemberDelete(pEventDeleteVo);
//        result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트삭제성공));
//
//        return result;
//    }
//
//    /**
//     * 이벤트 등록
//     */
//    public String setEventInsert(P_EventUpdateVo pEventUpdateVo){
//        String result;
//        pEventUpdateVo.setOpName(MemberVo.getMyMemNo());
//        con_EventDao.callEventInsert(pEventUpdateVo);
//        result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트등록성공));
//
//        return result;
//    }
//
//    /**
//     * 이벤트 수정
//     */
//    public String setEventUpdate(P_EventUpdateVo pEventUpdateVo){
//        String result;
//        pEventUpdateVo.setOpName(MemberVo.getMyMemNo());
//        con_EventDao.callEventUpdate(pEventUpdateVo);
//        result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트수정성공));
//
//        return result;
//    }
//
//    /**
//     * 이벤트 응모자 목록
//     */
//    public String getEventMemberList(P_EventMemberListInputVo pEventMemberListInputVo){
//        pEventMemberListInputVo.setPageNo(pEventMemberListInputVo.getPageNo() -1);
//        pEventMemberListInputVo.setPageNo(pEventMemberListInputVo.getPageNo() * pEventMemberListInputVo.getPageCnt());
//
//        ArrayList<P_EventMemberListOutputVo> eventMemberList = con_EventDao.callEventMemberList(pEventMemberListInputVo);
//        int totalCnt = con_EventDao.callEventMemberList_totalCnt(pEventMemberListInputVo);
//        int winCnt;
//
//        int maleCnt =0;
//        int femaleCnt =0;
//        int maleWinCnt =0;
//        int femaleWinCnt =0;
//        int overlapCnt =0;
//
//        List list = new ArrayList();
//        if(!DalbitUtil.isEmpty(eventMemberList)) {
//            for (int i = 0; i < eventMemberList.size(); i++) {
//                winCnt = con_EventDao.callEventMemberList_winCnt(eventMemberList.get(i).getMem_no());
//                P_EventMemberListOutputVo outVo = new P_EventMemberListOutputVo();
//                outVo.setRowNum(eventMemberList.get(i).getRowNum());
//                outVo.setEvent_idx(eventMemberList.get(i).getEvent_idx());
//                outVo.setMem_no(eventMemberList.get(i).getMem_no());
//                outVo.setIs_win(eventMemberList.get(i).getIs_win());
//                outVo.setOrder(eventMemberList.get(i).getOrder());
//                outVo.setMem_userid(eventMemberList.get(i).getMem_userid());
//                outVo.setMem_nick(eventMemberList.get(i).getMem_nick());
//                outVo.setMem_sex(eventMemberList.get(i).getMem_sex());
//                outVo.setMem_birth_year(eventMemberList.get(i).getMem_birth_year());
//                outVo.setMem_birth_month(eventMemberList.get(i).getMem_birth_month());
//                outVo.setMem_birth_day(eventMemberList.get(i).getMem_birth_day());
//                outVo.setMem_phone(eventMemberList.get(i).getMem_phone());
//                outVo.setListenCnt(eventMemberList.get(i).getListenCnt());
//                outVo.setBroadCnt(eventMemberList.get(i).getBroadCnt());
//                outVo.setGiftCnt(eventMemberList.get(i).getGiftCnt());
//                outVo.setApplyCnt(eventMemberList.get(i).getApplyCnt());
//                outVo.setWinCnt(winCnt);
//                list.add(outVo);
//
//                if(eventMemberList.get(i).getMem_sex().equals("m")){
//                    maleCnt++;
//                    if(eventMemberList.get(i).getIs_win() == 1){
//                        maleWinCnt++;
//                    }
//                }else{
//                    femaleCnt++;
//                    if(eventMemberList.get(i).getIs_win() == 1){
//                        femaleWinCnt++;
//                    }
//                }
//                if(eventMemberList.get(i).getApplyCnt() > 1){
//                    overlapCnt++;
//                }
//            }
//        }
//
//        P_EventMemberListOutputVo summary = new P_EventMemberListOutputVo();
//        summary.setMaleCnt(maleCnt);
//        summary.setMaleWinCnt(maleWinCnt);
//        summary.setFemaleCnt(femaleCnt);
//        summary.setFemaleWinCnt(femaleWinCnt);
//        summary.setOverlapCnt(overlapCnt);
//
//
//        String result;
//        if(eventMemberList.size() > 0) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트응모자목록보기_성공, list, new PagingVo(totalCnt),summary));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트응모자목록보기_실패));
//        }
//        return result;
//    }
//
//
//    /**
//     * 이벤트 응모자 선정
//     */
//    public String getEventMemberSelWin(P_EventMemberSelWinVo pEventMemberSelWinVo){
//        pEventMemberSelWinVo.setOpName(MemberVo.getMyMemNo());
//        con_EventDao.callEventSelWIn(pEventMemberSelWinVo);
//
//        String result;
//        result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트응모자선정_성공));
//        return result;
//    }
//
//    /**
//     * 이벤트 중복 응모자 목록
//     */
//    public String getEventOverlapApplyList(P_EventMemberListInputVo pEventMemberListInputVo){
//        ArrayList<P_EventMemberListOutputVo> eventOverlapApplyList = con_EventDao.callEventOverlapApplyList(pEventMemberListInputVo);
//
//        String result;
//        if(eventOverlapApplyList.size() > 0) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트중복응모자목록보기_성공, eventOverlapApplyList));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트중복응모자목록보기_실패));
//        }
//        return result;
//    }
//
//
//    /**
//     * 이벤트 댓글 리스트
//     */
//    public String getEventReplyList(P_EventReplyListInputVo pEventReplyListInputVo) {
//        int totalCnt = con_EventDao.callEventReplyList_totalCnt(pEventReplyListInputVo);
//        ArrayList<P_EventReplyListOutputVo> eventReplyList = con_EventDao.callEventReplyList(pEventReplyListInputVo);
//
//        String result;
//        if(eventReplyList.size() > 0) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트중복응모자목록보기_성공, eventReplyList, new PagingVo(totalCnt)));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트중복응모자목록보기_실패));
//        }
//        return result;
//    }
//
//    /**
//     * 이벤트 댓글 삭제
//     */
//    public String getEventReplyDelete(P_EventReplyDeleteInputVo pEventReplyDeleteInputVo) {
//        String result;
//        pEventReplyDeleteInputVo.setOpName(MemberVo.getMyMemNo());
//        int delResult =con_EventDao.callEventReplyDelete(pEventReplyDeleteInputVo);
//        if(delResult > 0){
//            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트댓글삭제성공));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.이벤트댓글삭제실패));
//        }
//
//        return result;
//    }
}
