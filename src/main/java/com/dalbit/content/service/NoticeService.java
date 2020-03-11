package com.dalbit.content.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.NoticeDao;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.common.code.*;
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
public class NoticeService {

    @Autowired
    ExcelService excelService;

    @Autowired
    NoticeDao noticeDao;

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;


    /**
     * 사이트 공지 보기
     */
    public String callServiceCenterNoticeList(P_noticeListInputVo pNoticeListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pNoticeListInputVo);

        ArrayList<P_noticeListOutputVo> noticeList = noticeDao.callServiceCenterNoticeList(procedureVo);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, noticeList, new PagingVo(procedureVo.getRet())));
        }else if(Status.공지사항조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지사항조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지사항조회_에러));
        }

        return result;
    }

    /**
     * 사이트 공지 엑셀
     */
    public Model getListExcel(P_noticeListInputVo pNoticeListInputVo, Model model) {
        ProcedureVo procedureVo = new ProcedureVo(pNoticeListInputVo);

        List<P_noticeListOutputVo> list = noticeDao.callServiceCenterNoticeList(procedureVo);

        String[] headers = {"공지번호", "공지구분", "공지제목", "상단고정여부", "노출설정", "작성자 이름", "작성자 번호", "작성일자"};
        int[] headerWidths = {2000, 1000, 5000, 1000, 1000, 3000, 3000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            HashMap hm = new LinkedHashMap();

            hm.put("noticeIdx", DalbitUtil.isEmpty(list.get(i).getNoticeIdx()) ? "" : list.get(i).getNoticeIdx());
            hm.put("slctType", DalbitUtil.isEmpty(list.get(i).getSlctType()) ? "" : list.get(i).getSlctType());
            hm.put("title", DalbitUtil.isEmpty(list.get(i).getTitle()) ? "" : list.get(i).getTitle());
            hm.put("topFix", DalbitUtil.isEmpty(list.get(i).getTopFix()) ? "" : list.get(i).getTopFix());
            hm.put("viewOn", DalbitUtil.isEmpty(list.get(i).getViewOn()) ? "" : list.get(i).getViewOn());
            hm.put("opName1", DalbitUtil.isEmpty(list.get(i).getOpName()) ? "" : list.get(i).getOpName());
            hm.put("opName2", DalbitUtil.isEmpty(list.get(i).getOpName()) ? "" : list.get(i).getOpName());
            hm.put("opName3", DalbitUtil.isEmpty(list.get(i).getOpName()) ? "" : list.get(i).getOpName());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("회원정보",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "회원목록");

        return model;
    }


    /**
     * 사이트 공지 상세 조회
     */
    public String callServiceCenterNoticeListDetail(P_noticeDetailInputVo p_noticeDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(p_noticeDetailInputVo);

        noticeDao.callServiceCenterNoticeListDetail(procedureVo);
        P_noticeDetailOutputVo noticeDetail = new Gson().fromJson(procedureVo.getExt(), P_noticeDetailOutputVo.class);

        String result;

        if(Status.공지상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지상세조회_성공, noticeDetail));
        } else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지상세조회_공지번호없음));
        }

        return result;
    }

    /**
     * 사이트 공지 등록
     */
    public String callServiceCenterNoticeAdd(P_noticeInsertVo pNoticeInsertVo){
        pNoticeInsertVo.setOpName(MemberVo.getMyMemNo());

        ProcedureVo procedureVo = new ProcedureVo(pNoticeInsertVo);

        noticeDao.callServiceCenterNoticeAdd(procedureVo);

        String result;
        if(Status.공지등록성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지등록성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지등록실패));
        }

        return result;
    }

    /**
     * 사이트 공지 수정
     */
    public String callServiceCenterNoticeUpdate(P_noticeUpdateVo pNoticeUpdateVo) {
        ProcedureVo procedureVo = new ProcedureVo(pNoticeUpdateVo);

        noticeDao.callServiceCenterNoticeUpdate(procedureVo);
        String result;
        if(Status.공지수정성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지수정성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지수정실패));
        }

        return result;
    }

    /**
     * 사이트 공지 삭제
     */
    public String callServiceCenterNoticeDelete(P_noticeDeleteVo pNoticeDeleteVo) {

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pNoticeDeleteVo.getNoticeIdxs().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_noticeDeleteVo(idxs[i]));

            noticeDao.callServiceCenterNoticeDelete(procedureVo);

            if (Status.공지삭제성공.getMessageCode().equals(procedureVo.getRet())) {
                sucCnt++;
            } else {
                failCnt++;
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt){
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지삭제성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지삭제실패, resultMap));
        }

        return result;
    }


}
