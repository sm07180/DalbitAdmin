package com.dalbit.customer.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.code.*;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.dao.DeclarationDao;
import com.dalbit.customer.vo.procedure.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.DateUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Slf4j
@Service
public class DeclarationService {

    @Autowired
    ExcelService excelService;

    @Autowired
    DeclarationDao declarationDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    Mem_MemberDao mem_MemberDao;

    /**
     * 신고 목록 조회
     */
    public String callServiceCenterReportList(P_DeclarationListInputVo pDeclarationListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pDeclarationListInputVo);

        ArrayList<P_DeclarationListOutputVo> declareList = declarationDao.callServiceCenterReportList(procedureVo);

        String result;

        if(declareList.size() > 0) {

            for(int i=0;i<declareList.size();i ++ ){
                P_DeclarationListOutputVo outVo = declarationDao.getReportCount(declareList.get(i).getReported_mem_no());
                declareList.get(i).setTotalReportedCnt(outVo.getTotalReportedCnt());
                declareList.get(i).setTotalOpCnt(outVo.getTotalOpCnt());
            }

            for(int i=0;i<declareList.size();i++){
                MemberVo outVo = mem_MemberDao.getMemberInfo(declareList.get(i).getMem_no());
                if(!DalbitUtil.isEmpty(outVo)) {
                    declareList.get(i).setMem_sex(outVo.getMem_sex());
                    declareList.get(i).setMem_birth_year(outVo.getMem_birth_year());
                    declareList.get(i).setMem_birth_month(outVo.getMem_birth_month());
                    declareList.get(i).setMem_birth_day(outVo.getMem_birth_day());
                }
                MemberVo outVo2 = mem_MemberDao.getMemberInfo(declareList.get(i).getReported_mem_no());
                if(!DalbitUtil.isEmpty(outVo2)) {
                    declareList.get(i).setReported_mem_sex(outVo2.getMem_sex());
                    declareList.get(i).setReported_mem_birth_year(outVo2.getMem_birth_year());
                    declareList.get(i).setReported_mem_birth_month(outVo2.getMem_birth_month());
                    declareList.get(i).setReported_mem_birth_day(outVo2.getMem_birth_day());
                }
            }
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고목록조회_성공, declareList, new PagingVo(procedureVo.getRet())));
        } else if(Status.신고목록조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고목록조회_데이터없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고목록조회_에러));
        }

        return result;
    }

    /**
     * 신고 목록 엑셀
     */
    public Model getListExcel(P_DeclarationListInputVo pDeclarationListInputVo, Model model){
        pDeclarationListInputVo.setPageCnt(100000);
        ProcedureVo procedureVo = new ProcedureVo(pDeclarationListInputVo);
        List<P_DeclarationListOutputVo> list = declarationDao.callServiceCenterReportList(procedureVo);

        String[] headers = {"No", "플랫폼", "신고구분", "신고자 UserID", "신고자 User닉네임", "신고 대상 UserID", "신고 대상 User닉네임", "접수 일시", "처리 일시", "처리 상태", "처리자"};
        int[] headerWidths = {3000, 6000, 3000, 6000, 6000, 6000, 6000, 3000, 3000, 3000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            HashMap hm = new LinkedHashMap();

            hm.put("no", list.size()-i);
            hm.put("platform", DalbitUtil.isEmpty(list.get(i).getPlatform()) ? "" : list.get(i).getPlatform());
            hm.put("reason", DalbitUtil.isEmpty(list.get(i).getReason()) ? "" : list.get(i).getReason());
            hm.put("mem_id", DalbitUtil.isEmpty(list.get(i).getMem_userid()) ? "" : list.get(i).getMem_userid());
            hm.put("mem_nick", DalbitUtil.isEmpty(list.get(i).getMem_nick()) ? "" : list.get(i).getMem_nick());
            hm.put("reported_mem_id", DalbitUtil.isEmpty(list.get(i).getReported_userid()) ? "" : list.get(i).getReported_userid());
            hm.put("reported_mem_nick", DalbitUtil.isEmpty(list.get(i).getReported_nick()) ? "" : list.get(i).getReported_nick());
            hm.put("regDate", DalbitUtil.isEmpty(list.get(i).getRegDate()) ? "" : list.get(i).getRegDate());
            hm.put("opDate", DalbitUtil.isEmpty(list.get(i).getOpDate()) ? "" : list.get(i).getOpDate());
            hm.put("status", DalbitUtil.isEmpty(list.get(i).getStatus()) ? "" : list.get(i).getStatus());
            hm.put("opName", DalbitUtil.isEmpty(list.get(i).getOpName()) ? "" : list.get(i).getOpName());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("신고문의",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "신고문의 목록");

        return model;
    }

    /**
     * 신고 목록 상세 조회
     */
    public String callServiceCenterReportDetail(P_DeclarationDetailInputVo pDeclarationDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pDeclarationDetailInputVo);

        declarationDao.callServiceCenterReportDetail(procedureVo);

        P_DeclarationDetailOutputVo declarationDetail = new Gson().fromJson(procedureVo.getExt(), P_DeclarationDetailOutputVo.class);

        String result;

        if(!DalbitUtil.isEmpty(declarationDetail)){
            MemberVo memInfoOutVo = DalbitUtil.getMemInfo(declarationDetail.getMem_no());
            if(!DalbitUtil.isEmpty(memInfoOutVo)) {
                declarationDetail.setMem_birth_year(memInfoOutVo.getMem_birth_year());
                declarationDetail.setMem_birth_month(memInfoOutVo.getMem_birth_month());
                declarationDetail.setMem_birth_day(memInfoOutVo.getMem_birth_day());
            }
            MemberVo memInfoOutVo2 = DalbitUtil.getMemInfo(declarationDetail.getReported_mem_no());
            if(!DalbitUtil.isEmpty(memInfoOutVo)) {
                declarationDetail.setReported_mem_birth_year(memInfoOutVo2.getMem_birth_year());
                declarationDetail.setReported_mem_birth_month(memInfoOutVo2.getMem_birth_month());
                declarationDetail.setReported_mem_birth_day(memInfoOutVo2.getMem_birth_day());
            }
        }

        if(Status.신고상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고상세조회_성공, declarationDetail));
        } else if(Status.신고상세조회_공지번호없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고상세조회_공지번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고상세조회_에러));
        }

        return result;
    }

    /**
     * 신고 처리
     */
    public String callServiceCenterReportOperate(P_DeclarationOperateVo pDeclarationOperateVo) {
        pDeclarationOperateVo.setOpName(MemberVo.getMyMemNo());
        String notiMemo = pDeclarationOperateVo.getNotiMemo().replace("<br>", "\n");
        pDeclarationOperateVo.setNotiMemo(notiMemo);

        ProcedureVo procedureVo = new ProcedureVo(pDeclarationOperateVo);

        declarationDao.callServiceCenterReportOperate(procedureVo);

        String result;

        if(Status.신고처리_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고처리_성공));
        } else if(Status.신고처리_신고번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고처리_신고번호없음));
        } else if(Status.신고처리_이미처리되었음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고처리_이미처리되었음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고처리_에러));
        }

        return result;
    }

    /**
     * 신고 처리 내역 건 수
     */
    public String callServiceCenterReportOpCount(ProcedureVo procedureVo) {

        declarationDao.callServiceCenterReportOpCount(procedureVo);

        P_DeclarationOpCountVo opCount = new Gson().fromJson(procedureVo.getExt(), P_DeclarationOpCountVo.class);

        String result;
        if(Status.신고처리내역수조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고처리내역수조회_성공, opCount));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고처리내역수조회_에러));
        }

        return result;
    }

    /**
     * 회원 신고 처리 내역 건 수
     */
    public String callServiceCenterReportOpCountTarget(P_DeclarationOperateCntInputVo pDeclarationOperateCntInputVo) {
        HashMap<P_DeclarationOpCountVo, String> OpList = declarationDao.callServiceCenterReportOpCountTarget(pDeclarationOperateCntInputVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.신고처리내역수조회_성공, OpList));
    }

}
