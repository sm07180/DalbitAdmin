package com.dalbit.broadcast.service;

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
    public String callbBroadcastTypeList(BroadcastTypeListVo broadcastTypeListVo) {
        List<BroadcastTypeListVo> codeList = new ArrayList<>();
        log.info("memberInfoLevelListVo.getLevel() {} " + broadcastTypeListVo.getType());
        if(broadcastTypeListVo.getType().equals("subject_type")){
            codeList = bBroadcastDao.callbBroadcastTypeList(broadcastTypeListVo);
        }
        ProcedureVo procedureVo = new ProcedureVo();
        procedureVo.setData(codeList);
        String result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, procedureVo.getData())));
        log.info(" ### 호출결과 ###" + result);
        return result;
    }

    public String getBroadcastList(BroadcastListVo broadcastListVo){
        log.info(" ### getSearch ###" + broadcastListVo.getSearch());
        log.info(" ### getGubun  ###" + broadcastListVo.getGubun());
        log.info(" ### getType   ###" + broadcastListVo.getType());
        log.info(" ### getValue   ###" + broadcastListVo.getValue());

        List<BroadcastListVo> list = bBroadcastDao.getBroadcastList(broadcastListVo);
        ProcedureVo procedureVo = new ProcedureVo();
        procedureVo.setData(list);
        String result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, procedureVo.getData())));
        log.info(" ### 호출결과 ###" + result);
        return result;
    }
}
