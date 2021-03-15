package com.dalbit.menu.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonMemberService;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.*;
import com.dalbit.content.service.PushService;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.menu.dao.Men_SpecialDao;
import com.dalbit.menu.vo.*;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
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
    CommonMemberService commonMemberService;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    ExcelService excelService;

    @Autowired
    Mem_MemberDao mem_MemberDao;

    @Autowired
    CommonService commonService;

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

        String[] headers = {"No", "회원번호", "닉네임", "신청일", "이름"
                , "연락처", "누적 방송시간", "90분 이상 방송 횟수", "좋아요 수", "순수 좋아요 수", "부스터 횟수"
                , "누적 청취자 수", "순수 청취자 수", "신고횟수", "받은 별"
                , "방송횟수", "30분 이상 청취자 수", "가산점", "스디 횟수"
                , "방송소개" , "내가 스페셜 DJ가 된다면", "상태"
                , "처리자", "처리일시"};
        int[] headerWidths = {3000, 5000, 5000, 6000, 3000
                , 5000, 3000, 3000, 3000, 3000, 3000
                , 3000, 3000, 3000, 3000
                , 3000, 4000, 3000, 3000
                , 5000, 6000, 3000
                , 5000, 6000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i=0; i<list.size(); i++) {
            HashMap hm = new LinkedHashMap();

            hm.put("no", list.size()-i);
            hm.put("mem_no", DalbitUtil.isEmpty(list.get(i).getMem_no()) ? "" : list.get(i).getMem_no());
            hm.put("mem_nick", DalbitUtil.isEmpty(list.get(i).getMem_nick()) ? "" : list.get(i).getMem_nick());
            hm.put("reg_date", DalbitUtil.isEmpty(list.get(i).getReg_date()) ? "" : list.get(i).getReg_date());
            hm.put("mem_name", DalbitUtil.isEmpty(list.get(i).getMem_name()) ? "" : list.get(i).getMem_name());

            hm.put("mem_phone", DalbitUtil.isEmpty(list.get(i).getMem_phone()) ? "" : list.get(i).getMem_phone());
            hm.put("airTime", DalbitUtil.isEmpty(list.get(i).getAirTime()) ? "" : list.get(i).getAirTime());
            hm.put("broadcastCnt", DalbitUtil.isEmpty(list.get(i).getBroadcastCnt()) ? "" : list.get(i).getBroadcastCnt());
            hm.put("goodSumCnt", DalbitUtil.isEmpty(list.get(i).getGoodCnt() + list.get(i).getBoostGoodCnt()) ? "" : list.get(i).getGoodCnt() + list.get(i).getBoostGoodCnt());
            hm.put("goodCnt", DalbitUtil.isEmpty(list.get(i).getGoodCnt()) ? "" : list.get(i).getGoodCnt());
            hm.put("boostGoodCnt", DalbitUtil.isEmpty(list.get(i).getBoostGoodCnt()) ? "" : list.get(i).getBoostGoodCnt() / 10);

            /*hm.put("fanCnt", DalbitUtil.isEmpty(list.get(i).getFanCnt()) ? "" : list.get(i).getFanCnt());*/

            hm.put("allListenCnt", DalbitUtil.isEmpty(list.get(i).getAllListenCnt()) ? "" : list.get(i).getAllListenCnt());
            hm.put("listenCnt", DalbitUtil.isEmpty(list.get(i).getListenCnt()) ? "" : list.get(i).getListenCnt());
            hm.put("reportCnt", DalbitUtil.isEmpty(list.get(i).getReportCnt()) ? "" : list.get(i).getReportCnt());
            hm.put("receiveStar", DalbitUtil.isEmpty(list.get(i).getReceiveStar()) ? "" : list.get(i).getReceiveStar());

            /*hm.put("chatCnt", DalbitUtil.isEmpty(list.get(i).getChatCnt()) ? "" : list.get(i).getChatCnt());*/
            hm.put("broadCnt", DalbitUtil.isEmpty(list.get(i).getBroadCnt()) ? "" : list.get(i).getBroadCnt());
            hm.put("listenCnt30", DalbitUtil.isEmpty(list.get(i).getListenCnt30()) ? "" : list.get(i).getListenCnt30());

            SpecialReqVo addPointParamVo = new SpecialReqVo();
            addPointParamVo.setSelect_year(specialReqVo.getSelect_year());
            addPointParamVo.setSelect_month(specialReqVo.getSelect_month());
            addPointParamVo.setMem_no(list.get(i).getMem_no());
            hm.put("addPoint", menSpecialDao.getSpecialDjAddpoint(addPointParamVo));
            hm.put("specialCnt", DalbitUtil.isEmpty(list.get(i).getSpecialCnt()) ? "" : list.get(i).getSpecialCnt());

            hm.put("title", DalbitUtil.isEmpty(list.get(i).getTitle()) ? "" : list.get(i).getTitle());
            hm.put("contents", DalbitUtil.isEmpty(list.get(i).getContents()) ? "" : list.get(i).getContents());

            String state = "신청";
            if(list.get(i).getState() == 2){
                state = "승인";
            }else if(list.get(i).getState() == 3){
                state = "반려";
            }

            hm.put("state", state);
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
     * 스페셜 달D 신청 가능 목록 엑셀
     */
    public Model reqAbleListExcel(SpecialReqVo specialReqVo, Model model) {
        specialReqVo.setPageCnt(1000000);

        List<SpecialReqVo> list = menSpecialDao.reqAbleSpecialDjList(specialReqVo);

        String[] headers = {"No", "회원번호", "닉네임" , "누적 방송시간", "90분 이상 방송 횟수"
                , "좋아요 수", "누적 청취자 수", "순수 청취자 수", "신고횟수", "받은 별"
                , "방송횟수", "30분 이상 청취자 수"};
        int[] headerWidths = {3000, 5000, 5000, 3000, 3000
                , 3000, 3000, 3000, 3000, 3000
                , 3000, 4000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i=0; i<list.size(); i++) {
            HashMap hm = new LinkedHashMap();

            hm.put("no", list.size()-i);
            hm.put("mem_no", DalbitUtil.isEmpty(list.get(i).getMem_no()) ? "" : list.get(i).getMem_no());
            hm.put("mem_nick", DalbitUtil.isEmpty(list.get(i).getMem_nick()) ? "" : list.get(i).getMem_nick());
            hm.put("airTime", list.get(i).getAirTime());
            hm.put("broadcastCnt", list.get(i).getBroadcastCnt());

            hm.put("goodCnt", list.get(i).getGoodCnt() + list.get(i).getBoostGoodCnt());
            hm.put("allListenCnt", list.get(i).getAllListenCnt());
            hm.put("listenCnt", list.get(i).getListenCnt());
            hm.put("reportCnt", list.get(i).getReportCnt());
            hm.put("receiveStar", list.get(i).getReceiveStar());

            hm.put("broadCnt", list.get(i).getBroadCnt());
            hm.put("listenCnt30", list.get(i).getListenCnt30());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("스페셜DJ 신청 가능 목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "스페셜DJ 신청 가능 목록");

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

        HashMap checkDjCnt = menSpecialDao.checkSpecialDjCnt(specialReqVo);
        if(0 < DalbitUtil.getIntMap(checkDjCnt, "is_exist")){
            return gsonUtil.toJson(new JsonOutputVo(Status.스페셜DJ_중복));
        }

        //승인 전 카운트임..
        boolean isBestDj = 5 <= DalbitUtil.getIntMap(checkDjCnt, "specialdj_cnt") ? true : false;

        //스페셜 DJ 뱃지 추가
        MemberBadgeVo memberBadgeVo = new MemberBadgeVo();
        memberBadgeVo.setMemNo(specialReqVo.getMem_no());
        memberBadgeVo.setBadgeType(isBestDj ? 16 : 17);
        memberBadgeVo.setBadgeRank(1);
        memberBadgeVo.setStartDate(specialReqVo.getStart_date());
        memberBadgeVo.setEndDate(specialReqVo.getEnd_date());
        memberBadgeVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = commonMemberService.memberBadgeAdd(memberBadgeVo);

        if(procedureVo.getRet().equals("0")) {
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

//        for(int i=0;i<list.size();i++) {
//            MemberVo outVo = mem_MemberDao.getMemberInfo(list.get(i).getMem_no());
//            if(!DalbitUtil.isEmpty(outVo)) {
//                list.get(i).setMem_sex(outVo.getMem_sex());
//            }
//        }

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

        HashMap checkDjCnt = menSpecialDao.checkSpecialDjCnt(specialReqVo);
        boolean isBestDj = 5 < DalbitUtil.getIntMap(checkDjCnt, "specialdj_cnt") ? true : false;

        MemberBadgeVo memberBadgeVo = new MemberBadgeVo();
        memberBadgeVo.setBadgeType(isBestDj ? 16 : 17);
        memberBadgeVo.setMemNo(specialReqVo.getMem_no());
        memberBadgeVo.setStartDate(specialReqVo.getSelect_year()+"-"+specialReqVo.getSelect_month()+"-01");
        ProcedureVo procedureVo = commonMemberService.memberBadgeDelete(memberBadgeVo);

        if(procedureVo.getRet().equals("0")) {
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

    /**
     * 스페셜 달D 신청 관리 조회
     */
    public String selectManageInfo(SpecialDjManageVo specialDjManageVo) {

        try{

            SpecialDjManageVo specialDjManageInfo = new SpecialDjManageVo();
            if(!DalbitUtil.isEmpty(specialDjManageVo.getSelect_year())){
                specialDjManageInfo = menSpecialDao.selectManageInfo(specialDjManageVo);
                specialDjManageInfo.setContentList(menSpecialDao.selectManageContentList(specialDjManageVo));
            }

            List<CodeVo> specialDjCondition = commonService.getCodeList("special_dj_condition");

            var result = new HashMap();
            result.put("specialDjManageInfo", specialDjManageInfo);
            result.put("specialDjCondition", specialDjCondition);

            return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));

        }catch (Exception e){
            return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
    }

    /**
     * 스페셜 달D 신청 관리 등록
     */
    public String insertManageInfo(SpecialDjManageVo specialDjManageVo) {

        try{

            SpecialDjManageVo getManageInfo = menSpecialDao.selectManageInfo(specialDjManageVo);
            if(!DalbitUtil.isEmpty(getManageInfo)){
                return gsonUtil.toJson(new JsonOutputVo(Status.스페셜DJ_참여조건설정_중복));
            }

            specialDjManageVo.setOp_name(MemberVo.getMyMemNo());
            menSpecialDao.insertManageInfo(specialDjManageVo);

            //컨텐츠 삭제 후 다시 등록
            menSpecialDao.deleteManageContent(specialDjManageVo);
            specialDjManageVo.getContentList().stream().forEach(content -> {
                content.setSelect_year(specialDjManageVo.getSelect_year());
                content.setSelect_month(specialDjManageVo.getSelect_month());
                menSpecialDao.insertManageContent(content);
            });

            return gsonUtil.toJson(new JsonOutputVo(Status.생성));

        }catch (Exception e){
            return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
    }

    /**
     * 스페셜 달D 신청 관리 조회
     */
    public String updateManageInfo(SpecialDjManageVo specialDjManageVo) {

        try{
            specialDjManageVo.setOp_name(MemberVo.getMyMemNo());
            menSpecialDao.updateManageInfo(specialDjManageVo);

            //컨텐츠 삭제 후 다시 등록
            menSpecialDao.deleteManageContent(specialDjManageVo);
            specialDjManageVo.getContentList().stream().forEach(content -> {
                content.setSelect_year(specialDjManageVo.getSelect_year());
                content.setSelect_month(specialDjManageVo.getSelect_month());
                menSpecialDao.insertManageContent(content);
            });


            return gsonUtil.toJson(new JsonOutputVo(Status.수정));

        }catch (Exception e){
            return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
    }
    /**
     * 스페셜 달D 신청 관리 목록 조회
     */
    public String selectManageList(SpecialDjManageVo specialDjManageVo) {

        try{
            List<SpecialDjManageVo> list = menSpecialDao.selectManageList(specialDjManageVo);

            int listCnt = list.size();

            return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(listCnt, 1, 9999)));

        }catch (Exception e){
            return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
    }

    public String selectReqAbleSpecialDjList(SpecialReqVo specialReqVo) {
        specialReqVo.setOp_name(MemberVo.getMyMemNo());
        List<SpecialReqVo> list = menSpecialDao.reqAbleSpecialDjList(specialReqVo);
        int listCnt = menSpecialDao.reqAbleSpecialDjCnt(specialReqVo);
        specialReqVo.setTotalCnt(listCnt);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(specialReqVo.getTotalCnt(), specialReqVo.getPageStart(), specialReqVo.getPageCnt())));
        return result;
    }

    /**
     * 베스트 스페셜 DJ 가능 회원
     */
    public String selectBestAbleList(SpecialDjBestVo specialDjBestVo) {

        ProcedureVo procedureVo = new ProcedureVo(specialDjBestVo);
        List<SpecialDjBestVo> list = menSpecialDao.callBestAbleList(procedureVo);

        PagingVo pagingVo = new Gson().fromJson(procedureVo.getExt(), PagingVo.class);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(pagingVo.getTotalCnt(), specialDjBestVo.getPageStart(), specialDjBestVo.getPageCnt())));
        return result;
    }

    /**
     * 스페셜 리그
     */
    public String callSpecialLeagueList(SpecialVo specialVo) {

        ProcedureVo procedureVo = new ProcedureVo(specialVo);
        List<SpecialLeagueVo> list = menSpecialDao.callSpecialLeagueList(procedureVo);

        PagingVo pagingVo = new Gson().fromJson(procedureVo.getExt(), PagingVo.class);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(pagingVo.getTotalCnt(), pagingVo.getPageStart(), pagingVo.getPageCnt())));
        return result;
    }


}
