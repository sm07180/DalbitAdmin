package com.dalbit.customer.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.dao.Cus_QuestionDao;
import com.dalbit.customer.vo.FaqVo;
import com.dalbit.customer.vo.procedure.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Slf4j
@Service
public class Cus_QuestionService {

    @Autowired
    Cus_QuestionDao cus_questionDao;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    ExcelService excelService;

    public String getQuestionList(P_QuestionListInputVo pQuestionListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pQuestionListInputVo);

        ArrayList<P_QuestionListOutputVo> questionList = cus_questionDao.callQuestionList(procedureVo);
        P_QuestionListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_QuestionListOutputVo.class);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.문의목록조회_성공, questionList, new PagingVo(procedureVo.getRet()),summary));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.문의목록조회_실패));
        }

        return result;
    }

    /**
     *  1:1 문의하기 상세 조회
     */
    public String callServiceCenterQnaDetail(P_QuestionDetailInputVo pQuestionDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pQuestionDetailInputVo);
        cus_questionDao.callServiceCenterQnaDetail(procedureVo);
        P_QuestionDetailOutputVo questionDetail = new Gson().fromJson(procedureVo.getExt(), P_QuestionDetailOutputVo.class);

        String result;

        if(Status.일대일문의상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의상세조회_성공, questionDetail));
        } else if(Status.일대일문의상세조회_문의번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의상세조회_문의번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의상세조회_에러));
        }

        return result;
    }

    /**
     *  1:1 문의하기 처리하기
     */
    public String callServiceCenterQnaOperate(P_QuestionOperateVo pQuestionOperateVo){
        pQuestionOperateVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pQuestionOperateVo,true);
        cus_questionDao.callServiceCenterQnaOperate(procedureVo);

        String result;
        if(Status.일대일문의처리_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리_성공));
        } else if(Status.일대일문의처리_문의번호없음.getMessageCode().equals((procedureVo.getRet()))) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리_문의번호없음));
        } else if(Status.일대일문의처리_이미처리됐음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리_이미처리됐음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리_에러));
        }

        return result;
    }

    public List<FaqVo> getFaqGroupList(){
        return cus_questionDao.getFaqGroupList();
    }

    public List<FaqVo> getFaqSubList(FaqVo faqVo){
        return cus_questionDao.getFaqSubList(faqVo);
    }

    /**
     * 회원 1:1문의 내역 건 수
     */
    public String getQuestionCountTarget(P_QuestionListInputVo pQuestionListInputVo) {
        HashMap<P_QuestionListOutputVo, String> questionList = cus_questionDao.callQuestionCountTarget(pQuestionListInputVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.문의목록조회_성공, questionList));
    }


    /**
     * 회원 1:1문의 내역 건 삭제
     */
    public String getQuestionDelete(P_QuestionDeleteVo pQuestionDeleteVo){
        cus_questionDao.callQuestionDelete(pQuestionDeleteVo);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.삭제));
        return result;
    }

    /**
     * 문의 엑셀
     */
    public Model getListExcel(P_QuestionListInputVo pQuestionListInputVo, Model model) {
        pQuestionListInputVo.setPageCnt(100000);
        ProcedureVo procedureVo = new ProcedureVo(pQuestionListInputVo);

        List<P_QuestionListOutputVo> list = cus_questionDao.callQuestionList(procedureVo);

        String[] headers = {"No", "문의유형", "플랫폼", "Browser", "문의자UserId", "문의자닉네임", "문의제목","문의내용", "접수일시","처리일시", "처리상태", "처리자"};
        int[] headerWidths = {3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            HashMap hm = new LinkedHashMap();


            String slctType = null;
            if(list.get(i).getSlct_type() == 1) slctType = "회원정보";
            else if(list.get(i).getSlct_type() == 2) slctType = "회원정보";
            else if(list.get(i).getSlct_type() == 3) slctType = "청취하기";
            else if(list.get(i).getSlct_type() == 4) slctType = "결제";
            else if(list.get(i).getSlct_type() == 5) slctType = "건의하기";
            else if(list.get(i).getSlct_type() == 6) slctType = "장애/버그";
            else if(list.get(i).getSlct_type() == 7) slctType = "선물/아이템";
            else if(list.get(i).getSlct_type() == 99) slctType = "기타";

            hm.put("no", list.size() - i);
            hm.put("mem1", DalbitUtil.isEmpty(slctType) ? "" : slctType);
            hm.put("mem2", DalbitUtil.isEmpty(list.get(i).getPlatform()) ? "" : list.get(i).getPlatform());
            hm.put("mem3", DalbitUtil.isEmpty(list.get(i).getBrowser()) ? "" : list.get(i).getBrowser());
            hm.put("mem4", DalbitUtil.isEmpty(list.get(i).getMem_userid()) ? "" : list.get(i).getMem_userid());
            hm.put("mem5", DalbitUtil.isEmpty(list.get(i).getMem_nick()) ? "" : list.get(i).getMem_nick());
            hm.put("mem6", DalbitUtil.isEmpty(list.get(i).getQuestion_title()) ? "" : list.get(i).getQuestion_title());
            hm.put("mem7", DalbitUtil.isEmpty(list.get(i).getQuestion_contents()) ? "" : list.get(i).getQuestion_contents());
            hm.put("mem8", DalbitUtil.isEmpty(list.get(i).getWriteDateFormat()) ? "" :list.get(i).getWriteDateFormat());
            hm.put("mem9", DalbitUtil.isEmpty(list.get(i).getOpDateFormat()) ? "" :list.get(i).getOpDateFormat());
            if(list.get(i).getState() == 0){
                hm.put("mem10", "미처리");
            }else if(list.get(i).getState() == 1){
                hm.put("mem10", "처리완료");
            }else if(list.get(i).getState() == 2){
                hm.put("mem10", "처리중");
            }
            hm.put("mem11", DalbitUtil.isEmpty(list.get(i).getOp_name()) ? "" : list.get(i).getOp_name());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "회원 목록");

        return model;
    }


    /**
     *  1:1 문의하기 처리중 상태 변경
     */
    public String callServiceCenterQnaCatch(P_QuestionOperateVo pQuestionOperateVo){
        pQuestionOperateVo.setOpName(MemberVo.getMyMemNo());
        int check;
        if(DalbitUtil.exceptionUser().indexOf(MemberVo.getMyMemNo()) > -1){
            check = 2;
        }else {
            cus_questionDao.callServiceCenterQnaChatchRelease_all(pQuestionOperateVo);

            check = cus_questionDao.callServiceCenterQnaStateCheck(pQuestionOperateVo);
        }
        String result;
        if(check == 1){
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리중_상태변경_실패));
        }else if (check == 2){
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리중_상태변경_안함));
        }else{
            cus_questionDao.callServiceCenterQnaCatch(pQuestionOperateVo);
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리중_상태변경_성공));
        }

        return result;
    }

    /**
     *  1:1 문의하기 처리중 상태 해제
     */
    public String callServiceCenterQnaChatchRelease(P_QuestionOperateVo pQuestionOperateVo){
        pQuestionOperateVo.setOpName(MemberVo.getMyMemNo());

        int check = cus_questionDao.callServiceCenterQnaStateCheck(pQuestionOperateVo);

        String result;
        if(check > 0){
            cus_questionDao.callServiceCenterQnaChatchRelease(pQuestionOperateVo);
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리중_상태해제_성공));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리중_상태해제_실패));
        }

        return result;
    }

    /**
     *  1:1 문의하기 처리중 상태 전체 해제
     */
    public String callServiceCenterQnaChatchRelease_all(){
        P_QuestionOperateVo pQuestionOperateVo = new P_QuestionOperateVo();
        pQuestionOperateVo.setOpName(MemberVo.getMyMemNo());
        cus_questionDao.callServiceCenterQnaChatchRelease_all(pQuestionOperateVo);
        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.일대일문의처리중_상태해제_성공));

        return result;
    }
}
