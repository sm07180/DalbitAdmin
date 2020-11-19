package com.dalbit.broadcast.service;

import com.dalbit.broadcast.dao.Bro_BehaviorDao;
import com.dalbit.broadcast.vo.procedure.*;
import com.dalbit.common.code.Status;
import com.dalbit.common.dao.CommonDao;
import com.dalbit.common.vo.*;
import com.dalbit.util.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Slf4j
@Service
public class Bro_BehaviorService {

    @Autowired
    Bro_BehaviorDao bro_behaviorDao;
    @Autowired
    CommonDao commonDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    SocketUtil socketUtil;
    @Autowired
    JwtUtil jwtUtil;

    /**
     * 청취자 행위 유도 메시지 리스트 조회
     */
    public String callBehaviorList(P_BehaviorListInputVo pBehaviorListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pBehaviorListInputVo);
        ArrayList<P_BehaviorListOutputVo> msgList = bro_behaviorDao.callBehaviorList(procedureVo);
        String result;

        if (Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.청취유도메시지조회_성공, msgList));
        } else if (Status.청취유도메시지조회_데이터없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.청취유도메시지조회_데이터없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.청취유도메시지조회_실패));
        }
        return result;
    }

}
