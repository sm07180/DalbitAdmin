package com.dalbit.member.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.member.dao.Mem_WalletDao;
import com.dalbit.member.vo.procedure.P_WalletByeolListOutVo;
import com.dalbit.member.vo.procedure.P_WalletByeolVo;
import com.dalbit.member.vo.procedure.P_WalletDalListOutVo;
import com.dalbit.member.vo.procedure.P_WalletDalVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Mem_WalletService {

    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Mem_WalletDao mem_walletDao;

    /**
     * 내지갑 달 내역 조회
     */
    public String callMemberWalletDal(P_WalletDalVo pDalVo) {
        int totalCnt = mem_walletDao.callMemberWalletDal_totalCnt(pDalVo);
        pDalVo.setTotalCnt(totalCnt);
        int resultDalCnt = mem_walletDao.getResultDalCnt(pDalVo);
        List<P_WalletDalListOutVo> outVoList = mem_walletDao.callMemberWalletDal(pDalVo);

        HashMap summary = mem_walletDao.getResultDalSummary(pDalVo);

        if(DalbitUtil.isEmpty(outVoList) || outVoList.size() <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.내지갑_달사용내역조회_없음, new ArrayList<P_WalletDalListOutVo>(), new PagingVo(pDalVo.getTotalCnt(), pDalVo.getPageNo(), pDalVo.getPageCnt()), summary));
        }

        String result;
        if(outVoList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.내지갑_달사용내역조회_성공, outVoList, new PagingVo(pDalVo.getTotalCnt(), pDalVo.getPageNo(), pDalVo.getPageCnt()), summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.내지갑_달사용내역조회_실패));
        }
        return result;
    }


    /**
     * 내지갑 별 내역 조회
     */
    public String callMemberWalletByeol(P_WalletByeolVo pByeolVo) {
        int totalCnt = mem_walletDao.callMemberWalletByeol_totalCnt(pByeolVo);
        pByeolVo.setTotalCnt(totalCnt);
        int resultDalCnt = mem_walletDao.getResultByeolCnt(pByeolVo);
        List<P_WalletByeolListOutVo> outVoList = mem_walletDao.callMemberWalletByeol(pByeolVo);

        HashMap summary = mem_walletDao.getResultByeolSummary(pByeolVo);

        if(DalbitUtil.isEmpty(outVoList) || outVoList.size() <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.내지갑_별사용내역조회_없음, new ArrayList<P_WalletByeolListOutVo>(), new PagingVo(pByeolVo.getTotalCnt(), pByeolVo.getPageNo(), pByeolVo.getPageCnt()), summary));
        }

        String result;
        if(outVoList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.내지갑_별사용내역조회_성공, outVoList, new PagingVo(pByeolVo.getTotalCnt(), pByeolVo.getPageNo(), pByeolVo.getPageCnt()), summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.내지갑_별사용내역조회_실패));
        }
        return result;
    }
}
