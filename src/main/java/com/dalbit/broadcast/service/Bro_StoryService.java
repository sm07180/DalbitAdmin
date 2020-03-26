package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.Bro_StoryDao;
import com.dalbit.broadcast.vo.procedure.P_StoryListInputVo;
import com.dalbit.broadcast.vo.procedure.P_StoryListOutputVo;
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
public class Bro_StoryService {

    @Autowired
    Bro_StoryDao bro_StoryDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 생방송 선물 목록 조회
     */
    public String getStoryList(P_StoryListInputVo pStoryListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pStoryListInputVo);
        ArrayList<P_StoryListOutputVo> StoryList = bro_StoryDao.callStoryList(procedureVo);
        P_StoryListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_StoryListOutputVo.class);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_사연목록조회_성공, StoryList, new PagingVo(procedureVo.getRet()),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_사연목록조회_실패));
        }
        return result;
    }

}
