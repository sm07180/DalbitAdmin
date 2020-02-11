package com.dalbit.member.controller.rest;


import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.service.M_ListenService;
import com.dalbit.member.vo.ListenListVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.common.code.Status;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Slf4j
@RestController
@RequestMapping("rest/member/listen")
public class M_ListenRestController {

    @Autowired
    M_ListenService mListenService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

   @PostMapping("list")
    public String list() {
       List<ListenListVo> listenListVo = mListenService.getListenList();
       return gsonUtil.toJson(new JsonOutputVo(Status.청취기록보기성공, listenListVo));
   }

   @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model) throws GlobalException {
        String[] headers = {"청취방주제", "청취 방송제목", "청취시작시간", "청취종료시간", "청취진행시간", "받은 루비 개수", "청취 DJ닉네임"};
        int[] headerWidths={3000, 6000, 6000, 6000, 3000, 3000, 3000};

        List<ListenListVo> list = mListenService.getListenList();

        List<Object[]> bodies = new ArrayList<>();

        for(int i=0; i<list.size(); i++) {
            HashMap hm = new LinkedHashMap();

            hm.put("subjectType", DalbitUtil.isEmpty(list.get(i).getSubjectType()) ? "" : list.get(i).getSubjectType());
            hm.put("title", DalbitUtil.isEmpty(list.get(i).getTitle()) ? "" : list.get(i).getTitle());
            hm.put("startDate", DalbitUtil.isEmpty(list.get(i).getStartDate()) ? "" : list.get(i).getStartDate());
            hm.put("endDate", DalbitUtil.isEmpty(list.get(i).getEndDate()) ? "" : list.get(i).getEndDate());
            hm.put("listentime", DalbitUtil.isEmpty(list.get(i).getListenTime()) ? "" : list.get(i).getListenTime());
            hm.put("giftRuby", DalbitUtil.isEmpty(list.get(i).getGiftRuby()) ? "" : list.get(i).getGiftRuby());
            hm.put("memNick", DalbitUtil.isEmpty(list.get(i).getMemNick()) ? "" : list.get(i).getMemNick());


            bodies.add(hm.values().toArray());

        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("청취기록", vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "청취목록");

        excelService.renderMergedOutputModel(model.asMap(), request, response);

        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
   }

   @PostMapping("listenHistory_detail")
    public String listenHistory_detail(HttpServletRequest request) {
       ListenListVo apiData = new ListenListVo();
       apiData.setMemNo((String)request.getParameter("mem_no"));
       apiData.setTmp((String)request.getParameter("tmp"));
       log.info("@@@" + (String)request.getParameter("mem_no") + (String)request.getParameter("tmp"));

       List<ListenListVo> list = mListenService.getListenHistory_detail(apiData);
       return gsonUtil.toJson(new JsonOutputVo(Status.청취기록보기성공, list));
   }








}
