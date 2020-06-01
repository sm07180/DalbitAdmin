package com.dalbit.status.service;


import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.status.dao.Sta_QuestionDao;
import com.dalbit.status.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Service
public class Sta_QuestionService {

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Sta_QuestionDao sta_QuestionDao;

    /**
     * 1:1문의 총계
     */
    public String callQuestionTotal(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        ArrayList<P_QuestionTotalOutDetailVo> detailList = sta_QuestionDao.callQuestionTotal(procedureVo);
        P_QuestionTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_QuestionTotalOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 1:1문의 유형별
     */
    public String callQuestionSlct(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        ArrayList<P_QuestionSlctOutDetailVo> detailList = sta_QuestionDao.callQuestionSlct(procedureVo);
        P_QuestionSlctOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_QuestionSlctOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 1:1문의 플랫폼별
     */
    public String callQuestionPlatform(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        ArrayList<P_QuestionPlatformOutDetailVo> detailList = sta_QuestionDao.callQuestionPlatform(procedureVo);
        P_QuestionPlatformOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_QuestionPlatformOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 1:1문의 미처리건
     */
    public String callQuestionUntreated(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        ArrayList<P_QuestionUntreatedOutDetailVo> detailList = sta_QuestionDao.callQuestionUntreated(procedureVo);
        P_QuestionUntreatedOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_QuestionUntreatedOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 1:1문의 고정
     */
    public String callQuestionInfo(){
        ProcedureVo procedureVo = new ProcedureVo();
        sta_QuestionDao.callQuestionInfo(procedureVo);
        P_QuestionInfoOutVo info = new Gson().fromJson(procedureVo.getExt(), P_QuestionInfoOutVo.class);

        var result = new HashMap<String, Object>();
        result.put("info", info);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

}
