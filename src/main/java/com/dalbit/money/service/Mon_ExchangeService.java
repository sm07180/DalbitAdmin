package com.dalbit.money.service;

import com.dalbit.administrate.vo.procedure.P_FaqListInputVo;
import com.dalbit.administrate.vo.procedure.P_FaqListOutputVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.money.dao.Mon_ExchangeDao;
import com.dalbit.money.vo.Mon_ExchangeInputVo;
import com.dalbit.money.vo.Mon_ExchangeOutputVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Slf4j
@Service
public class Mon_ExchangeService {

    @Autowired
    Mon_ExchangeDao monExchangeDao;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    public String selectExchangeList(Mon_ExchangeInputVo monExchangeInputVo){

        int exchangeCnt = monExchangeDao.selectExchangeCnt(monExchangeInputVo);
        ArrayList<Mon_ExchangeOutputVo> exchangeList = monExchangeDao.selectExchangeList(monExchangeInputVo);

        var resultMap = new HashMap<>();
        resultMap.put("exchangeCnt", exchangeCnt);
        resultMap.put("exchangeList", exchangeList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultMap));
    }

    public String selectExchangeSummary(Mon_ExchangeInputVo monExchangeInputVo){

        monExchangeInputVo.setIsSpecial(1);
        ArrayList<Integer> specialSummaryList = monExchangeDao.selectSummaryInfo(monExchangeInputVo);

        monExchangeInputVo.setIsSpecial(0);
        ArrayList<Integer> generalSummaryList = monExchangeDao.selectSummaryInfo(monExchangeInputVo);

        var resultMap = new HashMap<>();
        resultMap.put("specialSummaryList", specialSummaryList);
        resultMap.put("generalSummaryList", generalSummaryList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultMap));
    }

    public Model getListExcel(Mon_ExchangeInputVo monExchangeInputVo, Model model) {
        monExchangeInputVo.setTotalCnt(100000);

        ArrayList<Mon_ExchangeOutputVo> exchangeList = monExchangeDao.selectExchangeList(monExchangeInputVo);

        String[] headers = {
            "No", "아이디", "이름", "예금주", "금액",
            "소득세", "주민세", "수수료", "실지급액",  "주민번호",
            "연락처", "은행명", "계좌번호", "주소", "상세주소"
        };
        int[] headerWidths = {
            1000, 4000, 3000, 3000, 3000,
            2000, 2000, 2000, 3000, 4000,
            3500, 3000, 5000, 10000, 10000
        };

        int taxStart = 33330;   //33,330(taxStart) 이하는 세금부과 안함.
        int fees = 500;         //수수료는 500원 고정

        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < exchangeList.size(); i++){
            var exchangeVo = exchangeList.get(i);

            HashMap hm = new LinkedHashMap();

            hm.put("no", exchangeList.size()-i);
            hm.put("id", DalbitUtil.isEmpty(exchangeVo.getMem_id()) ? "" : exchangeVo.getMem_id());
            hm.put("name", DalbitUtil.isEmpty(exchangeVo.getMem_name()) ? "" : exchangeVo.getMem_name());
            hm.put("accountName", DalbitUtil.isEmpty(exchangeVo.getAccount_name()) ? "" : exchangeVo.getAccount_name());

            int cashReal = DalbitUtil.isEmpty(exchangeVo.getCash_basic()) ? 0 : exchangeVo.getCash_basic();
            hm.put("cashReal", cashReal);

            int incomeTax = 0;
            if(0 < exchangeVo.getCash_basic() && taxStart <= exchangeVo.getCash_basic()){
                incomeTax = (int) (exchangeVo.getCash_basic() * 0.003) * 10;
            }
            hm.put("incomeTax", incomeTax);

            int juminTax = 0;
            if(0 < incomeTax && juminTax <= exchangeVo.getCash_basic()){
                juminTax = (int) (incomeTax * 0.01) * 10;
            }
            hm.put("juminTax", juminTax);

            hm.put("fees", fees);

            int exchangeCash = (cashReal - (incomeTax + juminTax)) - fees;
            hm.put("exchangeCash", exchangeCash);

            hm.put("socialNo", DalbitUtil.isEmpty(exchangeVo.getSocial_no()) ? "" : DalbitUtil.convertJuminNo(exchangeVo.getSocial_no()));
            hm.put("phoneNo", DalbitUtil.isEmpty(exchangeVo.getPhone_no()) ? "" : DalbitUtil.convertPhoneNo(exchangeVo.getPhone_no()));
            hm.put("bankCode", DalbitUtil.isEmpty(exchangeVo.getBank_code()) ? "" : exchangeVo.getBank_code());
            hm.put("accountNo", DalbitUtil.isEmpty(exchangeVo.getAccount_no()) ? "" : exchangeVo.getAccount_no());
            hm.put("address1", DalbitUtil.isEmpty(exchangeVo.getAddress_1()) ? "" : exchangeVo.getAddress_1());
            hm.put("address2", DalbitUtil.isEmpty(exchangeVo.getAddress_2()) ? "" : exchangeVo.getAddress_2());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("환전",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "환전 목록");
        model.addAttribute("listSize", exchangeList.size());

        return model;
    }

    public String selectExchangeDetail(Mon_ExchangeInputVo monExchangeInputVo){

        Mon_ExchangeOutputVo monExchangeOutputVo = monExchangeDao.selectExchangeDetail(monExchangeInputVo);

        var resultMap = new HashMap<>();
        resultMap.put("detail", monExchangeOutputVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultMap));
    }

    public String updateExchangeDetail(Mon_ExchangeOutputVo monExchangeOutputVo){

        monExchangeDao.updateExchangeDetail(monExchangeOutputVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.수정));
    }

    public String updateExchangeComplete(Mon_ExchangeOutputVo monExchangeOutputVo){

        monExchangeDao.updateExchangeComplete(monExchangeOutputVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.수정));
    }

    public String updateExchangeMultiComplete(Mon_ExchangeInputVo monExchangeInputVo){

        monExchangeDao.updateExchangeMultiComplete(monExchangeInputVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.수정));
    }

}
