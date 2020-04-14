package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.Bro_LikeDao;
import com.dalbit.broadcast.vo.procedure.P_LikeListInputVo;
import com.dalbit.broadcast.vo.procedure.P_LikeListOutputVo;
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
    public String getLikeList(P_LikeListInputVo pLikeListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pLikeListInputVo);
        ArrayList<P_LikeListOutputVo> likeList = bro_LikeDao.callLikeList(procedureVo);
        P_LikeListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_LikeListOutputVo.class);

        List list = new ArrayList();
        if(!DalbitUtil.isEmpty(likeList)){
            for (int i=0; i < likeList.size(); i++){
                P_LikeListOutputVo outVo = new P_LikeListOutputVo();
                outVo.setMem_no(likeList.get(i).getMem_no());
                outVo.setMem_userid(likeList.get(i).getMem_userid());
                outVo.setMem_nick(likeList.get(i).getMem_nick());
                outVo.setLevel(likeList.get(i).getLevel());
                outVo.setGrade(likeList.get(i).getGrade());
                outVo.setGoodDate(likeList.get(i).getGoodDate());
                outVo.setAccumCnt(likeList.get(i).getAccumCnt());
                outVo.setBoosterDateFormat(likeList.get(i).getBoosterDateFormat());
                outVo.setRank(likeList.get(i).getRank());
                if(DalbitUtil.isEmpty(likeList.get(i).getMem_userid())){
                    ArrayList<P_LikeListOutputVo> withdrawal = bro_LikeDao.callLikeList_withdrawal(likeList.get(i).getMem_no());
                    outVo.setMem_userid(withdrawal.get(0).getMem_userid());
                    outVo.setMem_nick(withdrawal.get(0).getMem_nick());
                }
                list.add(outVo);
            }
        }
        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_좋아요목록조회_성공, list, new PagingVo(procedureVo.getRet()),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송_좋아요목록조회_실패));
        }
        return result;
    }

}
