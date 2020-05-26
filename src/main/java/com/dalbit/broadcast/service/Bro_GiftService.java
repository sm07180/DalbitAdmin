package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.Bro_GiftDao;
import com.dalbit.broadcast.vo.procedure.P_GiftListInputVo;
import com.dalbit.broadcast.vo.procedure.P_GiftListOutputVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
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

    /**
     * 생방송 선물 목록 조회
     */
    public String getGiftList(P_GiftListInputVo pGiftListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pGiftListInputVo);
        ArrayList<P_GiftListOutputVo> GiftList = bro_GiftDao.callGiftList(procedureVo);

        pGiftListInputVo.setPageNo(pGiftListInputVo.getPageNo() -1);
        pGiftListInputVo.setPageNo(pGiftListInputVo.getPageNo() * pGiftListInputVo.getPageCnt());

        ArrayList<P_GiftListOutputVo> GiftList_thumbnail = bro_GiftDao.callGiftList_thumbnail(pGiftListInputVo);
        P_GiftListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_GiftListOutputVo.class);

        List list = new ArrayList();
        if(!DalbitUtil.isEmpty(GiftList)) {
            for (int i = 0; i < GiftList.size(); i++) {
                P_GiftListOutputVo outVo = new P_GiftListOutputVo();
                outVo.setRowNum(GiftList.get(i).getRowNum());
                outVo.setMem_no(GiftList.get(i).getMem_no());
                outVo.setUserId(GiftList.get(i).getUserId());
                outVo.setNickName(GiftList.get(i).getNickName());
                outVo.setLevel(GiftList.get(i).getLevel());
                outVo.setGrade(GiftList.get(i).getGrade());
                outVo.setGiftDateFormat(GiftList.get(i).getGiftDateFormat());
                outVo.setItemImage(GiftList.get(i).getItemImage());
                outVo.setItemName(GiftList.get(i).getItemName());
                outVo.setItem_thumbnail(GiftList.get(i).getItem_thumbnail());
                outVo.setAccumCnt(GiftList.get(i).getAccumCnt());
                outVo.setItem_thumbnail(GiftList_thumbnail.get(i).getItem_thumbnail());
                outVo.setItemCnt(GiftList_thumbnail.get(i).getItemCnt());
                outVo.setSecret(GiftList_thumbnail.get(i).getSecret());

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
