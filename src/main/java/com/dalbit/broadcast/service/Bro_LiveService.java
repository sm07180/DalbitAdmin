package com.dalbit.broadcast.service;

import com.dalbit.broadcast.dao.Bro_LiveDao;
import com.dalbit.broadcast.vo.procedure.P_LiveListInputVo;
import com.dalbit.broadcast.vo.procedure.P_LiveListOutputVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Bro_LiveService {

    @Autowired
    Bro_LiveDao bro_LiveDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 실시간 최신 방송 list 목록
     */
    public String callLiveList(P_LiveListInputVo pLiveListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pLiveListInputVo);
        ArrayList<P_LiveListOutputVo> liveList = bro_LiveDao.callLiveList(procedureVo);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송목록조회_성공, liveList, new PagingVo(procedureVo.getRet())));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.생방송목록조회_에러));
        }
        return result;
    }

}
