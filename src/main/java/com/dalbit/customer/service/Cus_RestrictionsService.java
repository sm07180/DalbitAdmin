package com.dalbit.customer.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.customer.dao.Cus_RestrictionsDao;
import com.dalbit.customer.proc.Cus_SmsProc;
import com.dalbit.customer.vo.procedure.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Slf4j
@Service
public class Cus_RestrictionsService {

    @Autowired
    Cus_RestrictionsDao cusRestrictionsDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    ExcelService excelService;

    @Autowired
    Cus_SmsProc cusSmsProc;

    /**
     * 경고/정지 회원 리스트 조회
     */
    public String getWithdrawalList(P_WithdrawalListInputVo pWithdrawalListInputVo) {
        int count = cusRestrictionsDao.getWithdrawalListCnt(pWithdrawalListInputVo);
        pWithdrawalListInputVo.setTotalCnt(count);

        List<P_WithdrawalListOutputVo> list = cusRestrictionsDao.getWithdrawalList(pWithdrawalListInputVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(pWithdrawalListInputVo.getTotalCnt(), pWithdrawalListInputVo.getPageStart(), pWithdrawalListInputVo.getPageCnt())));
        return result;
    }

    /**
     * 강제퇴장 리스트 조회
     */
    public String getForcedList(P_ForcedListInputVo pForcedListInputVo) {
        int count = cusRestrictionsDao.getForcedListCnt(pForcedListInputVo);
        pForcedListInputVo.setTotalCnt(count);

        List<P_ForcedListOutputVo> list = cusRestrictionsDao.getForcedList(pForcedListInputVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(pForcedListInputVo.getTotalCnt(), pForcedListInputVo.getPageStart(), pForcedListInputVo.getPageCnt())));
        return result;
    }

    /**
     * 연령제한 리스트 조회
     */
    public String getAgeLimitList(P_AgeLimitListInputVo pAgeLimitListInputVo) {
        List<Object> getList = cusSmsProc.getAgeLimitList(pAgeLimitListInputVo);

        List<P_AgeLimitListOutputVo> list = DBUtil.getList(getList, P_AgeLimitListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        String result = gsonUtil.toJson
            (new JsonOutputVo(Status.조회, list,
                new PagingVo(listCnt, pAgeLimitListInputVo.getPageNo(), pAgeLimitListInputVo.getPagePerCnt())));

        return result;
    }
}
