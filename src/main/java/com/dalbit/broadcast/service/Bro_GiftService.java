package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.Bro_GiftDao;
import com.dalbit.broadcast.vo.procedure.P_GiftListInputVo;
import com.dalbit.broadcast.vo.procedure.P_GiftListOutputVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

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
        P_GiftListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_GiftListOutputVo.class);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_선물목록조회_성공, GiftList, new PagingVo(procedureVo.getRet()),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_선물목록조회_실패));
        }
        return result;
    }

}
