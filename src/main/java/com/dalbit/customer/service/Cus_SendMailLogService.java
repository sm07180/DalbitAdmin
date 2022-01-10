package com.dalbit.customer.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.proc.Common;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.payment.vo.ParentsEmailLogSelOutputVo;
import com.dalbit.payment.vo.ParentsEmailLogSelVo;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class Cus_SendMailLogService {
    @Autowired Common common;
    @Autowired GsonUtil gsonUtil;

    /**
     * 미성년자 메일 발송 내역 리스트
     */
    public String parentsAuthEmailLogSel(ParentsEmailLogSelVo parentsEmailLogSelVo) {
        String result;
        List<Object> obj = common.parentsAuthEmailLogSel(parentsEmailLogSelVo);
        List<ParentsEmailLogSelOutputVo> list = DBUtil.getList(obj, ParentsEmailLogSelOutputVo.class);
        int listCnt = DBUtil.getData(obj, Integer.class);

        for(ParentsEmailLogSelOutputVo vo : list) {
            String mailSlct = vo.getMail_slct();
            if(StringUtils.equals(mailSlct, "a")) {
                vo.setMail_slct_name("동의 알림");
            }else if(StringUtils.equals(mailSlct, "p")) {
                vo.setMail_slct_name("결제");
            }else {
                vo.setMail_slct_name("결제 취소");
            }
        }

        result = gsonUtil.toJson
            (new JsonOutputVo(Status.조회, list,
                new PagingVo(listCnt, parentsEmailLogSelVo.getPageNo(), parentsEmailLogSelVo.getPagePerCnt())));

        return result;
    }
}
