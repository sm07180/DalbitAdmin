package com.dalbit.excel.controller;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Slf4j
@RestController
@RequestMapping("excel")
public class ExcelController {

    @Autowired
    ExcelService excelService;
    @Autowired
    GsonUtil gsonUtil;



    @GetMapping("download")
    public String download(HttpServletRequest request, HttpServletResponse response, Model model) throws GlobalException {
        String[] headers = {"String", "Integer", "Boolean", "Double", "Date", "Calendar", "Long"};
        int[] headerWidths = {3000, 3000, 3000, 3000, 3000, 3000, 3000};


        List<Object[]> bodies = new ArrayList<>();
        for(int i=0; i < 20; i++){
            HashMap hm = new LinkedHashMap();
            hm.put("key1", DalbitUtil.randomValue("string", 10));
            hm.put("key2", Integer.parseInt(DalbitUtil.randomValue("number", 5)) );
            hm.put("key3", Boolean.parseBoolean(i%2 == 0?"true": "false"));
            hm.put("key4", Double.parseDouble(DalbitUtil.randomValue("number", 20)));
            hm.put("key5", new Date());
            hm.put("key6", Calendar.getInstance());
            hm.put("key7", Long.parseLong(DalbitUtil.randomValue("number", 15)));

            bodies.add(hm.values().toArray());
        }

        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);

        SXSSFWorkbook workbook = excelService.excelDownload("test01",vo);

        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "테스트");

        excelService.renderMergedOutputModel(model.asMap(), request, response);

        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }



    @PostMapping("member")
    public String memberExcelDownload(HttpServletRequest request, HttpServletResponse response, Model model) throws GlobalException{

        String test001 = DalbitUtil.convertRequestParamToString(request, "test001");
        int test002 = DalbitUtil.convertRequestParamToInteger(request, "test002");
        String test003 = DalbitUtil.convertRequestParamToString(request, "test003");


          List<Object[]> bodies = new ArrayList<>();
        for(int i=0; i < 20; i++){
            HashMap hm = new LinkedHashMap();
            hm.put("1", DalbitUtil.randomValue("string", 10));
            hm.put("2", Integer.parseInt(DalbitUtil.randomValue("number", 5)) );
            hm.put("3", Boolean.parseBoolean(i%2 == 0?"true": "false"));
            hm.put("4", Double.parseDouble(DalbitUtil.randomValue("number", 20)));
            hm.put("5", new Date());
            hm.put("6", Calendar.getInstance());
            hm.put("7", Long.parseLong(DalbitUtil.randomValue("number", 15)));

            bodies.add(hm.values().toArray());
        }

        ExcelVo vo = new ExcelVo(bodies);

        SXSSFWorkbook workbook = excelService.excelDownload("회원",vo);

        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "회원");

        excelService.renderMergedOutputModel(model.asMap(), request, response);

        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

}
