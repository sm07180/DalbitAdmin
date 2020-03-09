package com.dalbit.broadcast.service;

import com.dalbit.broadcast.vo.BroadcastInfoOutVo;
import com.dalbit.broadcast.vo.BroadcastInfoVo;
import com.dalbit.broadcast.vo.BroadcastListVo;
import com.dalbit.common.code.Status;
import com.dalbit.util.GsonUtil;
import com.dalbit.broadcast.dao.B_BroadcastDao;
import com.dalbit.broadcast.vo.BroadcastTypeListVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class B_BroadcastService {

    @Autowired
    B_BroadcastDao bBroadcastDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;


    /**
     * 방송관리 Type 목록
     */
    public String callBroadcastTypeList(BroadcastTypeListVo broadcastTypeListVo) {
        List<BroadcastTypeListVo> codeList = new ArrayList<>();
        if(broadcastTypeListVo.getType().equals("subject_type")){
            codeList = bBroadcastDao.callBroadcastTypeList(broadcastTypeListVo);
        }
        ProcedureVo procedureVo = new ProcedureVo();
        procedureVo.setData(codeList);
        String result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, procedureVo.getData())));
        log.info(" ### 호출결과 ###" + result);
        return result;
    }

    /**
     * 방송 list 목록
     */

    public List<BroadcastListVo> callBroadcastList(BroadcastListVo broadcastListVo){
        List<BroadcastListVo> list = bBroadcastDao.callBroadcastList(broadcastListVo);
        return list;
    }

    public int callBroadcastList_cnt(BroadcastListVo broadcastListVo){
        return bBroadcastDao.callBroadcastList_cnt(broadcastListVo);
    }

    /**
     * 선택한 방 정보
     */
    public List<BroadcastInfoVo> callBroadcastInfo(BroadcastInfoVo broadcastInfoVo) {
        List<BroadcastInfoVo> list = bBroadcastDao.callBroadcastInfo(broadcastInfoVo);
        return list;
    }
}
