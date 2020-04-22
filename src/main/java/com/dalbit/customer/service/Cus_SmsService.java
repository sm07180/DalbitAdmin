package com.dalbit.customer.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.customer.dao.Cus_SmsDao;
import com.dalbit.customer.vo.SmsVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dalbit.common.code.*;
import org.springframework.ui.Model;

import java.util.*;

@Slf4j
@Service
public class Cus_SmsService {

    @Autowired
    Cus_SmsDao cusSmsDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    ExcelService excelService;

    /**
     * sms 리스트 조회
     */
    public String getSmsList(SmsVo smsVo) {
        int count = cusSmsDao.getSmsListCnt(smsVo);
        smsVo.setTotalCnt(count);

        List<SmsVo> list = cusSmsDao.getSmsList(smsVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(smsVo.getTotalCnt(), smsVo.getPageStart(), smsVo.getPageCnt())));
        return result;
    }

    /**
     * sms 엑셀 출력
     */
    public Model getListExcel(SmsVo smsVo, Model model) {
        int count = cusSmsDao.getSmsListCnt(smsVo);
        smsVo.setTotalCnt(count);

        List<SmsVo> list = cusSmsDao.getSmsList(smsVo);

        String[] headers = {"No", "발신번호", "수신번호", "발송일", "발송내용", "구분"};
        int[] headerWidths = {3000, 3000, 3000, 6000, 20000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i=0; i<list.size(); i++) {
            HashMap hm = new LinkedHashMap();

            hm.put("No", DalbitUtil.isEmpty(list.get(i).getCmid()) ? "" : list.get(i).getCmid());
            hm.put("send_phone", DalbitUtil.isEmpty(list.get(i).getSend_phone()) ? "" : list.get(i).getSend_phone());
            hm.put("dest_phone", DalbitUtil.isEmpty(list.get(i).getDest_phone()) ? "" : list.get(i).getDest_phone());
            hm.put("report_time", DalbitUtil.isEmpty(list.get(i).getReport_time()) ? "" : list.get(i).getReport_time());
            hm.put("msg_body", DalbitUtil.isEmpty(list.get(i).getMsg_body()) ? "" : list.get(i).getMsg_body());
            hm.put("vxml_file", DalbitUtil.isEmpty(list.get(i).getVxml_file()) ? "" : list.get(i).getVxml_file());

            bodies.add(hm.values().toArray());
        }

        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("문자 발송내역",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "문자 발송내역");

        return model;
    }

}
