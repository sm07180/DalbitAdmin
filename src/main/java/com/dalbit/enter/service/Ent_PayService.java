package com.dalbit.enter.service;


import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.enter.dao.Ent_PayDao;
import com.dalbit.enter.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Ent_PayService {

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Ent_PayDao ent_PayDao;

    /**
     * 결제/환불 고정
     * @return
     */
    public String callPayInfo(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        ent_PayDao.callPayInfo(procedureVo);

        P_PayInfoOutVo info = new Gson().fromJson(procedureVo.getExt(), P_PayInfoOutVo.class);
        var result = new HashMap<String, Object>();
        result.put("info", info);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 결제/취소현황 총계
     * @param pStatVo
     * @return
     */
    public String callPayTotal(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        List<P_PayTotalOutDetailVo> detailList =  ent_PayDao.callPayTotal(procedureVo);
        P_PayTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_PayTotalOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 결제/취소현황 연령별
     * @param pStatVo
     * @return
     */
    public String callPayAge(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        List<P_PayAgeOutDetailVo> detailList =  ent_PayDao.callPayAge(procedureVo);
        P_PayAgeOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_PayAgeOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 결제/취소현황 수단별
     * @param pStatVo
     * @return
     */
    public String callPayWay(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        List<P_PayWayOutDetailVo> detailList =  ent_PayDao.callPayWay(procedureVo);
        P_PayWayOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_PayWayOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 결제/취소현황 결제상품별
     * @param pStatVo
     * @return
     */
    public String callPayCode(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        List<P_PayCodeOutDetailVo> detailList =  ent_PayDao.callPayCode(procedureVo);
        P_PayCodeOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_PayCodeOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 결제/취소현황 취소
     * @param pStatVo
     * @return
     */
    public String callPayCancel(P_StatVo pStatVo){
        ProcedureVo procedureVo = new ProcedureVo(pStatVo);
        List<P_PayCancelOutDetailVo> detailList =  ent_PayDao.callPayCancel(procedureVo);
        P_PayCancelOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_PayCancelOutVo.class);
        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }
}
