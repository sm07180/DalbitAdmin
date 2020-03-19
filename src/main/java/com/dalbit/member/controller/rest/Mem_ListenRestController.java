package com.dalbit.member.controller.rest;

import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.service.Mem_ListenService;
import com.dalbit.member.vo.procedure.P_MemberListenInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/member/listen")
public class Mem_ListenRestController {

    @Autowired
    Mem_ListenService mem_ListenService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원 청취 목록
     */
    @PostMapping("list")
    public String list(P_MemberListenInputVo pMemberListenInputVo) {
        String result = mem_ListenService.getListenHistory(pMemberListenInputVo);
        return result;
    }

//   @PostMapping("listExcel")
//    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model) throws GlobalException {
//        String[] headers = {"청취방주제", "청취 방송제목", "청취시작시간", "청취종료시간", "청취진행시간", "받은 루비 개수", "청취 DJ닉네임"};
//        int[] headerWidths={3000, 6000, 6000, 6000, 3000, 3000, 3000};
//
//        List<ListenListVo> list = mListenService.getListenList();
//
//        List<Object[]> bodies = new ArrayList<>();
//
//        for(int i=0; i<list.size(); i++) {
//            HashMap hm = new LinkedHashMap();
//
//            hm.put("subjectType", DalbitUtil.isEmpty(list.get(i).getSubjectType()) ? "" : list.get(i).getSubjectType());
//            hm.put("title", DalbitUtil.isEmpty(list.get(i).getTitle()) ? "" : list.get(i).getTitle());
//            hm.put("startDate", DalbitUtil.isEmpty(list.get(i).getStartDate()) ? "" : list.get(i).getStartDate());
//            hm.put("endDate", DalbitUtil.isEmpty(list.get(i).getEndDate()) ? "" : list.get(i).getEndDate());
//            hm.put("listentime", DalbitUtil.isEmpty(list.get(i).getListenTime()) ? "" : list.get(i).getListenTime());
//            hm.put("memNick", DalbitUtil.isEmpty(list.get(i).getMemId()) ? "" : list.get(i).getMemId());
//            hm.put("memNick", DalbitUtil.isEmpty(list.get(i).getMemNick()) ? "" : list.get(i).getMemNick());
//            hm.put("giftRuby", DalbitUtil.isEmpty(list.get(i).getRuby()) ? "" : list.get(i).getRuby());
//            hm.put("giftRuby", DalbitUtil.isEmpty(list.get(i).getLike()) ? "" : list.get(i).getLike());
//
//
//            bodies.add(hm.values().toArray());
//
//        }
//        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
//        SXSSFWorkbook workbook = excelService.excelDownload("청취기록", vo);
//        model.addAttribute("locale", Locale.KOREA);
//        model.addAttribute("workbook", workbook);
//        model.addAttribute("workbookName", "청취목록");
//
//        excelService.renderMergedOutputModel(model.asMap(), request, response);
//
//        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
//   }
}
