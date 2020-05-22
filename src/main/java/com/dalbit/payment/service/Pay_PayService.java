package com.dalbit.payment.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.payment.dao.Pay_PayDao;
import com.dalbit.payment.vo.Pay_PayInputVo;
import com.dalbit.payment.vo.Pay_PayOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dalbit.common.code.*;

import java.util.List;

@Slf4j
@Service
public class Pay_PayService {

    @Autowired
    Pay_PayDao payPayDao;

    @Autowired
    GsonUtil gsonUtil;

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

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(getPayListCnt),summary));

        return result;
    }

}
