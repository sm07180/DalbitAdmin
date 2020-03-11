package com.dalbit.administrate.service;

import com.dalbit.administrate.dao.Adm_FaqDao;
import com.dalbit.administrate.vo.procedure.*;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.procedure.P_noticeListInputVo;
import com.dalbit.content.vo.procedure.P_noticeListOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
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
public class Adm_FaqService {

    @Autowired
    Adm_FaqDao adm_FaqDao;

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    ExcelService excelService;

    /**
     * Faq 조회
     */
    public String callFaqList(P_FaqListInputVo pFaqListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pFaqListInputVo);
        ArrayList<P_FaqListOutputVo> faqList = adm_FaqDao.callFaqList(procedureVo);
        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, faqList, new PagingVo(procedureVo.getRet())));
        }else if(Status.FAQ조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.FAQ조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.FAQ조회_에러));
        }

        return result;
    }

    /**
     * Faq 엑셀
     */
    public Model getListExcel(P_FaqListInputVo pFaqListInputVo, Model model) {
        ProcedureVo procedureVo = new ProcedureVo(pFaqListInputVo);

        List<P_FaqListOutputVo> list = adm_FaqDao.callFaqList(procedureVo);

        String[] headers = {"FAQ구분", "FAQ질문", "FAQ구분", "등록일시", "조회수", "사이트 적용", "처리자명"};
        int[] headerWidths = {2000, 5000, 2000, 5000, 2000, 3000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            HashMap hm = new LinkedHashMap();

            hm.put("faq1", DalbitUtil.isEmpty(list.get(i).getSlctType()) ? "" : list.get(i).getSlctType());
            hm.put("faq2", DalbitUtil.isEmpty(list.get(i).getQuestion()) ? "" : list.get(i).getQuestion());
            hm.put("faq3", DalbitUtil.isEmpty(list.get(i).getSlctType()) ? "" : list.get(i).getSlctType());
            hm.put("faq4", DalbitUtil.isEmpty(list.get(i).getWriteDate()) ? "" : list.get(i).getWriteDate());
            hm.put("faq5", DalbitUtil.isEmpty(list.get(i).getViewCnt()) ? "" : list.get(i).getViewCnt());
            hm.put("faq6", DalbitUtil.isEmpty(list.get(i).getViewOn()) ? "" : list.get(i).getViewOn());
            hm.put("faq7", DalbitUtil.isEmpty(list.get(i).getOpName()) ? "" : list.get(i).getOpName());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("FAQ",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "FAQ 목록");

        return model;
    }

    /**
     * Faq 상세 조회
     */
    public String callFaqListDetail(P_FaqListDetailInputVo pFaqListDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pFaqListDetailInputVo);
        adm_FaqDao.callFaqListDetail(procedureVo);

        P_FaqListDetailOutputVo faqDetail = new Gson().fromJson(procedureVo.getExt(), P_FaqListDetailOutputVo.class);
        String result;
        if(Status.FAQ상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.FAQ상세조회_성공, faqDetail));
        } else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.FAQ상세조회_FAQ번호없음));
        }

        return result;
    }

    /**
     * Faq 등록
     */
    public String callFaqAdd(P_FaqInsertVo pFaqInsertVo){
        pFaqInsertVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pFaqInsertVo, true);
        adm_FaqDao.callFaqAdd(procedureVo);
        String result;
        if(Status.FAQ등록성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.FAQ등록성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.FAQ등록실패));
        }

        return result;
    }

    /**
     * Faq 수정
     */
    public String callFaqUpdate(P_FaqUpdateVo pFaqUpdateVo) {
        ProcedureVo procedureVo = new ProcedureVo(pFaqUpdateVo, true);
        adm_FaqDao.callFaqUpdate(procedureVo);
        String result;
        if(Status.FAQ수정성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.FAQ수정성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.FAQ수정실패));
        }
        return result;
    }

    /**
     * Faq 삭제
     */
    public String callFaqDelete(P_FaqDeleteVo pFaqDeleteVo) {

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pFaqDeleteVo.getFaqIdxs().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_FaqDeleteVo(idxs[i]));

            adm_FaqDao.callFaqDelete(procedureVo);

            if (Status.FAQ삭제성공.getMessageCode().equals(procedureVo.getRet())) {
                sucCnt++;
            } else {
                failCnt++;
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt){
            result = gsonUtil.toJson(new JsonOutputVo(Status.FAQ삭제성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.FAQ삭제실패, resultMap));
        }

        return result;
    }
}
