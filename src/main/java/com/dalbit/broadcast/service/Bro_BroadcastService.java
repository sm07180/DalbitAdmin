package com.dalbit.broadcast.service;

import com.dalbit.broadcast.dao.Bro_BroadcastDao;
import com.dalbit.broadcast.vo.procedure.*;
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
public class Bro_BroadcastService {

    @Autowired
    Bro_BroadcastDao bro_BroadcastDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 생방송 list 목록
     */
    public String callBroadcastList(P_BroadcastListInputVo pBroadcastListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastListInputVo);
        ArrayList<P_BroadcastListOutputVo> broadList = bro_BroadcastDao.callBroadcastList(procedureVo);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송기록보기성공, broadList, new PagingVo(procedureVo.getRet())));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송기록보기실패));
        }
        return result;
    }


    /**
     * 선택한 방 정보
     */
    public String callBroadcastInfo(P_BroadcastDetailInputVo pBroadcastDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastDetailInputVo);

        bro_BroadcastDao.callBroadcastInfo(procedureVo);

        P_BroadcastDetailOutputVo broadcastDetail = new Gson().fromJson(procedureVo.getExt(), P_BroadcastDetailOutputVo.class);

        String result;

        if(Status.방송방상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방상세조회_성공, broadcastDetail));
        } else if(Status.방송방상세조회_공지번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방상세조회_공지번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방상세조회_에러));
        }

        return result;
    }

    /**
     * 방송방 정보수정 내역 보기
     */
    public String callBroadcastEditHistory(P_BroadcastEditHistInputVo pBroadcastEditHistInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastEditHistInputVo);

        ArrayList<P_BroadcastEditHistOutputVo> editList = bro_BroadcastDao.callBroadcastEditHistory(procedureVo);

        String result;

        if (Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방수정내역조회_성공, editList, new PagingVo(procedureVo.getRet())));
        } else if(Status.방송방수정내역조회_방번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방수정내역조회_방번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방수정내역조회_에러));
        }
        return result;

    }

}
