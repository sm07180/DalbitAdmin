package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.Bro_GiftDao;
import com.dalbit.broadcast.vo.procedure.P_GiftListInputVo;
import com.dalbit.broadcast.vo.procedure.P_GiftListOutputVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class Bro_GiftService {

    @Autowired
    Bro_GiftDao bro_GiftDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Mem_MemberDao mem_MemberDao;

    /**
     * 생방송 선물 목록 조회
     */
    public String getGiftList(P_GiftListInputVo pGiftListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pGiftListInputVo);
        ArrayList<P_GiftListOutputVo> GiftList = bro_GiftDao.callGiftList(procedureVo);

        pGiftListInputVo.setPageNo(pGiftListInputVo.getPageNo() -1);
        pGiftListInputVo.setPageNo(pGiftListInputVo.getPageNo() * pGiftListInputVo.getPageCnt());

        P_GiftListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_GiftListOutputVo.class);

        List list = new ArrayList();
        if(!DalbitUtil.isEmpty(GiftList)) {
            for (int i = 0; i < GiftList.size(); i++) {
                P_GiftListOutputVo outVo = new P_GiftListOutputVo();
                outVo.setRowNum(DalbitUtil.isEmpty(GiftList.get(i).getRowNum()) ? 0 : GiftList.get(i).getRowNum());
                outVo.setMem_no(DalbitUtil.isEmpty(GiftList.get(i).getMem_no()) ? "-" : GiftList.get(i).getMem_no());
                outVo.setUserId(DalbitUtil.isEmpty(GiftList.get(i).getUserId()) ? "-" : GiftList.get(i).getUserId());
                outVo.setNickName(DalbitUtil.isEmpty(GiftList.get(i).getNickName()) ? "-" : GiftList.get(i).getNickName());
                outVo.setLevel(DalbitUtil.isEmpty(GiftList.get(i).getLevel()) ? 0 : GiftList.get(i).getLevel());
                outVo.setGrade(DalbitUtil.isEmpty(GiftList.get(i).getGrade()) ? "-" : GiftList.get(i).getGrade());
                outVo.setGiftDateFormat(DalbitUtil.isEmpty(GiftList.get(i).getGiftDateFormat()) ? "-" : GiftList.get(i).getGiftDateFormat());
                outVo.setItemImage(DalbitUtil.isEmpty(GiftList.get(i).getItemImage()) ? "-" : GiftList.get(i).getItemImage());
                outVo.setItemName(DalbitUtil.isEmpty(GiftList.get(i).getItemName()) ? "-" : GiftList.get(i).getItemName());
                outVo.setInner(DalbitUtil.isEmpty(GiftList.get(i).getInner()) ? 0 : GiftList.get(i).getInner());
                outVo.setItem_thumbnail(DalbitUtil.isEmpty(GiftList.get(i).getItem_thumbnail()) ? "-" : GiftList.get(i).getItem_thumbnail());
                outVo.setAccumCnt(DalbitUtil.isEmpty(GiftList.get(i).getAccumCnt()) ? 0 : GiftList.get(i).getAccumCnt());

                outVo.setByeolCnt(DalbitUtil.isEmpty(GiftList.get(i).getByeolCnt()) ? 0 : GiftList.get(i).getByeolCnt());
                outVo.setAccumByeolCnt(DalbitUtil.isEmpty(GiftList.get(i).getAccumByeolCnt()) ? 0 : GiftList.get(i).getAccumByeolCnt());

                outVo.setItem_thumbnail(DalbitUtil.isEmpty(GiftList.get(i).getItem_thumbnail()) ? "-" : GiftList.get(i).getItem_thumbnail());
                outVo.setItemCnt(DalbitUtil.isEmpty(GiftList.get(i).getItemCnt()) ? 0 : GiftList.get(i).getItemCnt());
                outVo.setSecret(DalbitUtil.isEmpty(GiftList.get(i).getSecret()) ? 0 : GiftList.get(i).getSecret());

                MemberVo memInfoOutVo = mem_MemberDao.getMemberInfo(GiftList.get(i).getMem_no());
                if(!DalbitUtil.isEmpty(memInfoOutVo)) {
                    outVo.setMem_sex(DalbitUtil.isEmpty(memInfoOutVo.getMem_sex()) ? "n" : memInfoOutVo.getMem_sex());
                    outVo.setMem_birth_year(DalbitUtil.isEmpty(memInfoOutVo.getMem_birth_year()) ? "-" : memInfoOutVo.getMem_birth_year());
                    outVo.setMem_birth_month(DalbitUtil.isEmpty(memInfoOutVo.getMem_birth_month()) ? "-" : memInfoOutVo.getMem_birth_month());
                    outVo.setMem_birth_day(DalbitUtil.isEmpty(memInfoOutVo.getMem_birth_day()) ? "-" : memInfoOutVo.getMem_birth_day());
                }

                list.add(outVo);
            }
        }

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_선물목록조회_성공, list, new PagingVo(procedureVo.getRet()),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_선물목록조회_실패));
        }
        return result;
    }

}
