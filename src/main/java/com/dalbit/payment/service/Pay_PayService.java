package com.dalbit.payment.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.payment.dao.Pay_PayDao;
import com.dalbit.payment.vo.Pay_IosAttempInputVo;
import com.dalbit.payment.vo.Pay_IosAttempOutputVo;
import com.dalbit.payment.vo.Pay_PayInputVo;
import com.dalbit.payment.vo.Pay_PayOutputVo;
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
public class Pay_PayService {

    @Autowired
    Pay_PayDao payPayDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    ExcelService excelService;
    @Autowired
    Mem_MemberDao mem_MemberDao;

    /**
     *  결제 목록 조회
     */
    public String getPayList(Pay_PayInputVo pay_PayInputVo) {

        pay_PayInputVo.setPageNo(pay_PayInputVo.getPageNo() -1);
        pay_PayInputVo.setPageNo(pay_PayInputVo.getPageNo() * pay_PayInputVo.getPageCnt());
        List<Pay_PayOutputVo> list = payPayDao.getPayList(pay_PayInputVo);

        int getPayListCnt = payPayDao.getPayListCnt(pay_PayInputVo);

        //summary
        Pay_PayOutputVo summary = payPayDao.getPaySummary(pay_PayInputVo);

        for(int i=0;i<list.size();i++){
            MemberVo outVo = mem_MemberDao.getMemberInfo(list.get(i).getMem_no());
            if(!DalbitUtil.isEmpty(outVo)) {
                list.get(i).setMem_sex(outVo.getMem_sex());
            }
        }

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(getPayListCnt),summary));

        return result;
    }


    /**
     * 결제 엑셀
     */
    public Model getListExcel(Pay_PayInputVo payPayInputVo, Model model) {
        payPayInputVo.setPageCnt(60000);

        List<Pay_PayOutputVo> list = payPayDao.getPayList(payPayInputVo);

        String[] headers = {"No", "회원번호", "닉네임", "수단", "정보", "시도일시", "완료일시", "결제아이템", "금액", "취소 시 차감 달", "보유 달", "직원여부", "플랫폼", "취소일시", "취소실패사유", "처리자", "결제상태", "취소상태"};
        int[] headerWidths = {3000, 3000, 3000, 3000, 5000, 5000, 5000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            HashMap hm = new LinkedHashMap();

            String payWay = DalbitUtil.getPayWayConvert(list.get(i).getPay_way());  //결제수단 코드변환
            String platform = DalbitUtil.getPlatformConvert(list.get(i).getOs());   //플랫폼 변환

            hm.put("no", list.size() - i);
            hm.put("col1", DalbitUtil.isEmpty(list.get(i).getMem_no()) ? "" : list.get(i).getMem_no());
            hm.put("col2", DalbitUtil.isEmpty(list.get(i).getMem_nick()) ? "" : list.get(i).getMem_nick());
            hm.put("col3", DalbitUtil.isEmpty(payWay) ? "" : payWay);
            hm.put("col4", DalbitUtil.isEmpty(list.get(i).getPay_info_no()) ? "" : list.get(i).getPay_info_no() + " " + (DalbitUtil.isEmpty(list.get(i).getPay_info_nm()) ? "" : list.get(i).getPay_info_nm()));
            hm.put("col5", DalbitUtil.isEmpty(list.get(i).getPay_dt_comein()) ? "" : list.get(i).getPay_dt_comein());
            hm.put("col6", DalbitUtil.isEmpty(list.get(i).getPay_ok_date()) ? "" : list.get(i).getPay_ok_date() + " " + list.get(i).getPay_ok_time());
            hm.put("col7", DalbitUtil.isEmpty(list.get(i).getPay_code()) ? "" : list.get(i).getPay_code());
            hm.put("col8", DalbitUtil.isEmpty(list.get(i).getPay_amt()) ? "" : DalbitUtil.comma(list.get(i).getPay_amt())+"원");
            hm.put("col9", DalbitUtil.isEmpty(list.get(i).getDal_cnt()) ? "" : list.get(i).getDal_cnt());
            hm.put("col10", DalbitUtil.isEmpty(list.get(i).getTot_dal_cnt()) ? "" : list.get(i).getTot_dal_cnt());
            hm.put("col11", DalbitUtil.isEmpty(list.get(i).getChrgr_yn()) ? "" : list.get(i).getChrgr_yn().equals("1") ? "Y" : "N");
            hm.put("col12", DalbitUtil.isEmpty(platform) ? "" : platform);
            hm.put("col13", DalbitUtil.isEmpty(list.get(i).getCancel_dt()) ? "" : list.get(i).getCancel_dt());
            hm.put("col14", DalbitUtil.isEmpty(list.get(i).getFail_msg()) ? "" : list.get(i).getFail_msg());
            hm.put("col15", DalbitUtil.isEmpty(list.get(i).getOp_name()) ? "" : list.get(i).getOp_name());
            hm.put("col16", DalbitUtil.isEmpty(list.get(i).getPay_yn()) ? "" : list.get(i).getPay_yn().toUpperCase());
            hm.put("col17", DalbitUtil.isEmpty(list.get(i).getCancel_state()) ? "" : list.get(i).getCancel_state().toUpperCase());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "결제내역");

        return model;
    }

    public String selectIosAttempList(Pay_IosAttempInputVo payIosAttempInputVo) {

        int attempCnt = payPayDao.selectIosAttempCnt(payIosAttempInputVo);
        List<Pay_IosAttempOutputVo> attempList = payPayDao.selectIosAttempList(payIosAttempInputVo);

        var resultMap = new HashMap();
        resultMap.put("attempCnt", attempCnt);
        resultMap.put("attempList", attempList);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, resultMap));
        return result;
    }

}
