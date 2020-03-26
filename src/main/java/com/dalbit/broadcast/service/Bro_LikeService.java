package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.Bro_LikeDao;
import com.dalbit.broadcast.vo.procedure.P_LikeListInputVo;
import com.dalbit.broadcast.vo.procedure.P_LikeListOutputVo;
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
public class Bro_LikeService {

    @Autowired
    Bro_LikeDao bro_LikeDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 생방송 청취자 목록 조회
     */
    public String getListenerHistory_detail(P_LikeListInputVo pLikeListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pLikeListInputVo);
        ArrayList<P_LikeListOutputVo> likeList = bro_LikeDao.callLikeList(procedureVo);
        P_LikeListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_LikeListOutputVo.class);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_좋아요목록조회_성공, likeList, new PagingVo(procedureVo.getRet()),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_좋아요목록조회_실패));
        }
        return result;
    }

}
