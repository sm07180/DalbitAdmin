package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.PushDao;
import com.dalbit.content.vo.procedure.P_pushDeleteVo;
import com.dalbit.content.vo.procedure.P_pushDetailInputVo;
import com.dalbit.content.vo.procedure.P_pushInsertVo;
import com.dalbit.content.vo.procedure.P_pushUpdateVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class PushService {

    @Autowired
    PushDao pushDao;

    @Autowired
    GsonUtil gsonUtil;

    public String callServiceCenterPushListDetail(P_pushDetailInputVo p_pushDetailInputVo) {
        return null;
    }

    public String callServiceStmpPushAdd(P_pushInsertVo pPushInsertVo) {
        ProcedureVo procedureVo = new ProcedureVo(pPushInsertVo);

        pushDao.callServiceStmpPushAdd(procedureVo);

        String result;
        if(Status.푸시등록_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_성공));
        } else if(Status.푸시등록_요청회원번호미존재.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_요청회원번호미존재));
        } else if(Status.푸시등록_디바이스토큰미존재.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_디바이스토큰미존재));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_에러));
        }

        return result;
    }

    public String callServiceCenterPushUpdate(P_pushUpdateVo pPushUpdateVo) {
        return null;
    }

    public String callServiceCenterPushDelete(P_pushDeleteVo pPushDeleteVo) {
        return null;
    }
}
