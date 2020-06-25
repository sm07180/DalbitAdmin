package com.dalbit.member.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.member.dao.Mem_ExchangeDao;
import com.dalbit.member.vo.procedure.P_MemberExchangeInputVo;
import com.dalbit.money.vo.Mon_ExchangeOutputVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.JwtUtil;
import com.dalbit.util.SocketUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Mem_ExchangeService {

    @Autowired
    Mem_ExchangeDao mem_ExchangeDao;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    SocketUtil socketUtil;
    @Autowired
    JwtUtil jwtUtil;

    public String getExchangeHistory(P_MemberExchangeInputVo pMemberExchangeInputVo){

        pMemberExchangeInputVo.setPageNo(pMemberExchangeInputVo.getPageNo() -1);
        pMemberExchangeInputVo.setPageNo(pMemberExchangeInputVo.getPageNo() * pMemberExchangeInputVo.getPageCnt());

        ArrayList<Mon_ExchangeOutputVo> exchangeList = mem_ExchangeDao.getExchangeHistory(pMemberExchangeInputVo);
        int totalCnt = mem_ExchangeDao.getExchangeHistory_totalCnt(pMemberExchangeInputVo);

        String result;
        if(exchangeList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.환전내역보기성공, exchangeList, new PagingVo(totalCnt)));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.환전내역보기실패));
        }
        return result;
    }

    public String getExchangeHistory_detail(P_MemberExchangeInputVo pMemberExchangeInputVo){
        ArrayList<Mon_ExchangeOutputVo> exchangeList = mem_ExchangeDao.getExchangeHistory_detail(pMemberExchangeInputVo);

        String result;
        if(exchangeList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.환전내역보기성공, exchangeList));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.환전내역보기실패));
        }
        return result;
    }

}
