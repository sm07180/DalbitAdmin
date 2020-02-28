package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.service.M_BroadcastService;
import com.dalbit.member.vo.BroadListVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
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
@RequestMapping("rest/member/broadcast")
public class M_BroadcastRestController {

    @Autowired
    M_BroadcastService mBroadcastService;


    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("list")
    public String list(BroadListVo broadListVo){
        List<BroadListVo> list = mBroadcastService.getBroadHistory_detail(broadListVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.방송기록보기성공, list));

    }

   @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model) throws GlobalException {

       String[] headers = {"방송주제", "방송제목", "방송시작시간", "방송종료시간", "방송진행시간", "종료 시 평균 청취자 수", "받은 좋아요 수", "받은 골드 수"};
       int[] headerWidths={3000, 6000, 6000, 6000, 3000, 2000, 2000, 2000};

       List<BroadListVo> list = mBroadcastService.getBroadList();

       List<Object[]> bodies = new ArrayList<>();

       for(int i=0; i<list.size(); i++) {
           HashMap hm = new LinkedHashMap();
           hm.put("subjectType", DalbitUtil.isEmpty(list.get(i).getSubjectType()) ? "" : list.get(i).getSubjectType());
           hm.put("title", DalbitUtil.isEmpty(list.get(i).getTitle()) ? "" : list.get(i).getTitle());
           hm.put("startDate", DalbitUtil.isEmpty(list.get(i).getStartDate()) ? "" : list.get(i).getStartDate());
           hm.put("endDate", DalbitUtil.isEmpty(list.get(i).getEndDate()) ? "" : list.get(i).getEndDate());
           hm.put("airtime", DalbitUtil.isEmpty(list.get(i).getAirtime()) ? "" : list.get(i).getAirtime());
           hm.put("listener", DalbitUtil.isEmpty(list.get(i).getListener()) ? "" : list.get(i).getListener());
           hm.put("good", DalbitUtil.isEmpty(list.get(i).getGood()) ? "" : list.get(i).getGood());
           hm.put("gold", DalbitUtil.isEmpty(list.get(i).getGold()) ? "" : list.get(i).getGold());

           bodies.add(hm.values().toArray());
       }

       ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
       SXSSFWorkbook workbook = excelService.excelDownload("방송기록", vo);
       model.addAttribute("locale", Locale.KOREA);
       model.addAttribute("workbook", workbook);
       model.addAttribute("workbookName", "방송목록");

       excelService.renderMergedOutputModel(model.asMap(), request, response);

       return gsonUtil.toJson(new JsonOutputVo(Status. 엑셀다운로드성공));
   }
}
