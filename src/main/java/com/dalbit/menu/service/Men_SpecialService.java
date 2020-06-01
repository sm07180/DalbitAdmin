package com.dalbit.menu.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.content.service.PushService;
import com.dalbit.content.vo.procedure.P_pushInsertVo;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.member.vo.procedure.P_MemberReportVo;
import com.dalbit.menu.dao.Men_SpecialDao;
import com.dalbit.menu.vo.SpecialDjOrderVo;
import com.dalbit.menu.vo.SpecialReqVo;
import com.dalbit.menu.vo.SpecialSummaryVo;
import com.dalbit.menu.vo.SpecialVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.*;

@Slf4j
@Service
public class Men_SpecialService {

    @Autowired
    Men_SpecialDao menSpecialDao;

    @Autowired
    PushService pushService;

    @Autowired
    Mem_MemberDao memMemberDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    ExcelService excelService;

    /**
     * 스페셜 달D 건수
     */
    public String summary(SpecialSummaryVo specialSummaryVo) {
        SpecialSummaryVo count = menSpecialDao.summary(specialSummaryVo);
        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, count));
        return result;
    }

    /**
     * 스페셜 달D 신청 목록 조회
     */
    public String getReqSpecialList(SpecialReqVo specialReqVo) {
        specialReqVo.setOp_name(MemberVo.getMyMemNo());
        List<SpecialReqVo> list = menSpecialDao.getReqSpecialList(specialReqVo);
        int getReqSpecialListCnt = menSpecialDao.getReqSpecialListCnt(specialReqVo);
        specialReqVo.setTotalCnt(getReqSpecialListCnt);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(specialReqVo.getTotalCnt(), specialReqVo.getPageStart(), specialReqVo.getPageCnt())));

        return result;
    }

    /**
     * 스페셜 달D 신청 목록 엑셀
     */
    public Model getListExcel(SpecialReqVo specialReqVo, Model model) {
        specialReqVo.setPageCnt(1000000);

        List<SpecialReqVo> list = menSpecialDao.getReqSpecialList(specialReqVo);

        String[] headers = {"No", "회원번호", "닉네임", "신청일", "이름", "연락처", "제목", "내용", "상태", "처리자", "처리일시"};
        int[] headerWidths = {3000, 5000, 5000, 6000, 5000, 5000, 5000, 5000, 3000, 3000, 6000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i=0; i<list.size(); i++) {
            HashMap hm = new LinkedHashMap();

            hm.put("no", list.size()-i);
            hm.put("mem_no", DalbitUtil.isEmpty(list.get(i).getMem_no()) ? "" : list.get(i).getMem_no());
            hm.put("mem_nick", DalbitUtil.isEmpty(list.get(i).getMem_nick()) ? "" : list.get(i).getMem_nick());
            hm.put("reg_date", DalbitUtil.isEmpty(list.get(i).getReg_date()) ? "" : list.get(i).getReg_date());
            hm.put("mem_name", DalbitUtil.isEmpty(list.get(i).getMem_name()) ? "" : list.get(i).getMem_name());
            hm.put("mem_phone", DalbitUtil.isEmpty(list.get(i).getMem_phone()) ? "" : list.get(i).getMem_phone());
            hm.put("title", DalbitUtil.isEmpty(list.get(i).getTitle()) ? "" : list.get(i).getTitle());
            hm.put("contents", DalbitUtil.isEmpty(list.get(i).getContents()) ? "" : list.get(i).getContents());
            hm.put("state", DalbitUtil.isEmpty(list.get(i).getState()) ? "" : list.get(i).getState());
            hm.put("op_name", DalbitUtil.isEmpty(list.get(i).getOp_name()) ? "" : list.get(i).getOp_name());
            hm.put("last_upd_date" , DalbitUtil.isEmpty(list.get(i).getLast_upd_date()) ? "" : list.get(i).getLast_upd_date());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("스페셜DJ 신청 목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "스페셜DJ 신청 목록");

        return model;
    }

    /**
     * 스페셜 달D 신청 상세 조회
     */
    public String getReqSpecialDetail(SpecialReqVo specialReqVo) {
        SpecialReqVo detail = menSpecialDao.getReqSpecialDetail(specialReqVo);
        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, detail));
        return result;
    }

    /**
     * 스페셜 달D 신청 승인
     */
    @Transactional(readOnly = false)
    public String reqOk(SpecialReqVo specialReqVo) {

        int existCnt = menSpecialDao.checkSpecialDjCnt(specialReqVo);
        if(0 < existCnt){
            return gsonUtil.toJson(new JsonOutputVo(Status.스페셜DJ_중복));
        }

        specialReqVo.setOp_name(MemberVo.getMyMemNo());
        int result = menSpecialDao.reqOk(specialReqVo);

        specialReqVo.setState(2);
        menSpecialDao.reqOkUpdate(specialReqVo);

        specialReqVo.setSpecialdj_badge(1);
        menSpecialDao.profileUpdate(specialReqVo);

        if(result > 0) {
            // 스페셜 DJ 선정 Noti 발송
            sendNotiReqOK(specialReqVo.getMem_no());

            // 스페셜 DJ 선정 PUSH 발송
            sendPushReqOK(specialReqVo.getMem_no());
            return gsonUtil.toJson(new JsonOutputVo(Status.스페셜DJ승인완료_성공));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.스페셜DJ승인완료_실패));
        }
    }

    /**
     * 스페셜 달D 신청 거부
     */
    @Transactional(readOnly = false)
    public String reqReject(SpecialReqVo specialReqVo, SpecialVo specialVo) {
        specialReqVo.setOp_name(MemberVo.getMyMemNo());

        menSpecialDao.reqCancel(specialVo);

        specialReqVo.setState(3);

        int result= menSpecialDao.reqOkUpdate(specialReqVo);
        if(result > 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.스페셜DJ승인거부_성공));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.스페셜DJ승인거부_실패));
        }
    }

    /**
     * 스페셜 달D 목록 조회
     */
    public String getSpecialList(SpecialVo specialVo) {
        specialVo.setOp_name(MemberVo.getMyMemNo());
        int getSpecialListCnt = menSpecialDao.getSpecialListCnt(specialVo);
        specialVo.setTotalCnt(getSpecialListCnt);
        List<SpecialVo> list = menSpecialDao.getSpecialList(specialVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(specialVo.getTotalCnt(), specialVo.getPageStart(), specialVo.getPageCnt())));

        return result;
    }

    /**
     * 스페셜 달D 상세 조회
     */
    public String getSpecialDetail(SpecialVo specialVo) {
        SpecialVo detail = menSpecialDao.getSpecialDetail(specialVo);
        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, detail));
        return result;
    }

    /**
     * 스페셜 달D 승인 취소
     */
    @Transactional(readOnly = false)
    public String reqCancel(SpecialVo specialVo, SpecialReqVo specialReqVo) {
        specialVo.setOp_name(MemberVo.getMyMemNo());
        int result = menSpecialDao.reqCancel(specialVo);

        specialReqVo.setState(3);
        specialReqVo.setIdx(specialVo.getReq_idx());
        specialReqVo.setOp_name(MemberVo.getMyMemNo());
        menSpecialDao.reqOkUpdate(specialReqVo);

        specialReqVo.setSpecialdj_badge(0);
        menSpecialDao.profileUpdate(specialReqVo);

        if(result > 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.스페셜DJ승인취소_성공));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.스페셜DJ승인취소_실패));
        }
    }

    /**
     * 스페셜 달D 순위 변경 업데이트
     */
    public String updateOrder(SpecialDjOrderVo specialDjOrderVo) {

        try{
            String jsonData = specialDjOrderVo.getOrderJsonData();
            SpecialDjOrderVo[] SpecialDjOrderVoArray = new Gson().fromJson(jsonData, SpecialDjOrderVo[].class);

            Arrays.stream(SpecialDjOrderVoArray).forEach(orderInfo -> {
                menSpecialDao.updateOrder(orderInfo);
            });

            return gsonUtil.toJson(new JsonOutputVo(Status.스페셜DJ순위변경_성공));

        }catch (Exception e){
            return gsonUtil.toJson(new JsonOutputVo(Status.스페셜DJ순위변경_실패));
        }
    }



    public String sendPushReqOK(String mem_no){

        P_pushInsertVo pPushInsertVo = new P_pushInsertVo();

        pPushInsertVo.setMem_nos(mem_no);
        pPushInsertVo.setSend_cnt("1");
        pPushInsertVo.setSend_title("스페셜 DJ로 선정되었어요.");
        pPushInsertVo.setSend_cont("축하해요~ 스페셜DJ로 선정되셨어요. DJ님의 FLEX한 방송을 보여주세요♥");
        //TODO 스페셜DJ 공지 번호 입력 필요!!
        pPushInsertVo.setBoard_idx("22");
        pPushInsertVo.setSlct_push("7");
        pPushInsertVo.setIs_all("7");
        pPushInsertVo.setPlatform("111");
        pPushInsertVo.setStatus("0");
        pPushInsertVo.setMsg_type("0");
        pPushInsertVo.setImage_type("1");
        pPushInsertVo.setIs_direct("0");

        String pushResult = pushService.callContentsPushAdd(pPushInsertVo);
        log.info("[PUSH SEND RESULT] : {}" , pushResult);

        return pushResult;
    }

    public int sendNotiReqOK(String mem_no){
        P_MemberReportVo pMemberReportVo = new P_MemberReportVo();

        pMemberReportVo.setReported_mem_no(mem_no);
        pMemberReportVo.setSlctType(7);
        pMemberReportVo.setNotiContents("축하해요~ 스페셜DJ로 선정되셨어요. DJ님의 FLEX한 방송을 보여주세요♥");
        pMemberReportVo.setNotimemo("축하해요~ 스페셜DJ로 선정되셨어요. DJ님의 FLEX한 방송을 보여주세요♥");

        int notiResult = memMemberDao.callMemberNotification_Add(pMemberReportVo);
        log.info("[PUSH SEND RESULT] : {}" , notiResult);

        return notiResult;
    }
}
