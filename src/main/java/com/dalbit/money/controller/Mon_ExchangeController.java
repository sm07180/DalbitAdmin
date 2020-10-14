package com.dalbit.money.controller;

import com.dalbit.common.code.Status;
import com.dalbit.common.view.ExcelExportView;
import com.dalbit.common.view.MessageView;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.money.dao.Mon_ExchangeDao;
import com.dalbit.money.service.Mon_ExchangeService;
import com.dalbit.money.vo.Mon_ExchangeInputVo;
import com.dalbit.money.vo.Mon_ExchangeOutputVo;
import com.dalbit.util.DalbitUtil;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("money/exchange")
public class Mon_ExchangeController {

    @Autowired
    Mon_ExchangeService monExchangeService;

    @Autowired
    Mon_ExchangeDao monExchangeDao;

    @GetMapping("list")
    public String list() {
        return "money/exchange/list";
    }

    @RequestMapping("listExcel")
    public ModelAndView listExcel(Map map, ModelAndView mv, HttpServletRequest request, HttpServletResponse response, Mon_ExchangeInputVo monExchangeInputVo, Model model) throws GlobalException {

        monExchangeInputVo.setExcelYn("Y");
        monExchangeInputVo.setLast_reject(1);
        List<Object[]> body = monExchangeService.getExcelData(monExchangeInputVo, model);

        if(body.size() == 0){
            mv.setView(new MessageView("현재 환전 처리일이 아니거나, 처리되지 않은 신청 건이 없습니다.","window.close()",""));
            return mv;
        }

        String[] colums = null;
        String fileName = "";
        if(monExchangeInputVo.getIsSpecial() == 1) {
            colums = new String[]{"No", "아이디", "이름", "주민번호", "예금주", "금액",
                "스페셜DJ혜택", "과세금액", "소득세", "주민세", "수수료",
                "실지급액", "연락처", "은행명", "계좌번호",
                "주소"};

            fileName = "스페셜DJ 환전내역";
        }else{
            colums = new String[]{"No", "아이디", "이름", "주민번호", "예금주", "금액",
                /*"스페셜DJ혜택", "과세금액",*/ "소득세", "주민세", "수수료",
                "실지급액", "연락처", "은행명", "계좌번호",
                "주소"};
            fileName = "일반회원 환전내역";
        }

        map.put("fileName", fileName);
        map.put("sheetNames", "equipment");
        map.put("columns", colums);
        map.put("values", body);

        mv = new ModelAndView(new ExcelExportView());
        return mv;
    }


    @RequestMapping("completeListExcel")
    public ModelAndView completeListExcel(Map map, ModelAndView mv, HttpServletRequest request, HttpServletResponse response, Mon_ExchangeInputVo monExchangeInputVo, Model model) throws GlobalException {

        monExchangeInputVo.setExcelYn("Y");
        //monExchangeInputVo.setLast_reject(1);
        List<Object[]> body = monExchangeService.getCompleteExcelData(monExchangeInputVo, model);

        if(body.size() == 0){
            mv.setView(new MessageView("완료된 목록이 없습니다.","window.close()",""));
            return mv;
        }

        String[] colums = new String[]{"No", "주민번호", "예금주", "금액",
                "스페셜DJ혜택", "과세금액", "소득세", "주민세", "수수료",
                "실지급액", "연락처", "은행명", "계좌번호",
                "주소"};
        String fileName = "스페셜DJ 완료내역";

        map.put("fileName", fileName);
        map.put("sheetNames", "equipment");
        map.put("columns", colums);
        map.put("values", body);

        mv = new ModelAndView(new ExcelExportView());
        return mv;
    }

}
