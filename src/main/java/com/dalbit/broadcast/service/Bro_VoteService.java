package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.Bro_StoryDao;
import com.dalbit.broadcast.dao.Bro_VoteDao;
import com.dalbit.broadcast.vo.procedure.*;
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

@Slf4j
@Service
public class Bro_VoteService {

    @Autowired
    Bro_VoteDao bro_voteDao;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 투표목록
     * @param pVoteInputVo
     * @return
     */
    public String getVoteList(P_VoteInputVo pVoteInputVo){
        ArrayList<P_VoteListOutputVo> list = bro_voteDao.callVoteList(pVoteInputVo);
        PagingVo pPagingVo = new PagingVo();
        pPagingVo.setTotalCnt(list.size());

        String result;
        if(list.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, pPagingVo));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
        return result;
    }

    /**
     * 투표상세
     */
    public String getVoteItemList(P_VoteInputVo pVoteInputVo){
        ArrayList<P_VoteItemOutputVo> list = bro_voteDao.callVoteItemList(pVoteInputVo);
        PagingVo pPagingVo = new PagingVo();
        pPagingVo.setTotalCnt(list.size());

        String result;
        if(list.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, pPagingVo));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
        return result;
    }

}
