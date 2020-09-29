package com.dalbit.clip.service;

import com.dalbit.clip.dao.Cli_ClipStatusDao;
import com.dalbit.clip.vo.procedure.*;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Service
public class Cli_ClipStatusService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Cli_ClipStatusDao clipStatusDao;

    /**
     * 클립 성별 등록 시간/월간/연간
     */
    public String callClipStatusTime(P_ClipStatusVo pClipStatusVo){
        ProcedureVo procedureVo = new ProcedureVo(pClipStatusVo);
        ArrayList<P_ClipStatusTimeOutputVo> detailList = clipStatusDao.callClipStatusTime(procedureVo);
        P_ClipStatusTimeTotalOutputVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_ClipStatusTimeTotalOutputVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }



    /**
     * 클립 선물 통계 현황
     */
    public String callClipStatusGift(P_ClipStatusVo pClipStatusVo){
        ProcedureVo procedureVo = new ProcedureVo(pClipStatusVo);
        ArrayList<P_ClipStatusGiftOutputVo> clipStatusList = clipStatusDao.callClipStatusGift(procedureVo);

        P_ClipStatusGiftTotalOutputVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_ClipStatusGiftTotalOutputVo.class);

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", clipStatusList);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음, result));
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }


    /**
     * 클립 타입별 등록 시간/월간/연간
     */
    public String callClipStatusType(P_ClipStatusVo pClipStatusVo){
        ProcedureVo procedureVo = new ProcedureVo(pClipStatusVo);
        ArrayList<P_ClipStatusSubjectOutputVo> detailList = clipStatusDao.callClipStatusType(procedureVo);
        P_ClipStatusSubjectTotalOutputVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_ClipStatusSubjectTotalOutputVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 클립 플랫폼별 등록 시간/월간/연간
     */
    public String callClipStatusPlatform(P_ClipStatusVo pClipStatusVo) {
        ProcedureVo procedureVo = new ProcedureVo(pClipStatusVo);
        ArrayList<P_ClipStatusPlatformOutputVo> detailList = clipStatusDao.callClipStatusPlatform(procedureVo);
        P_ClipStatusPlatformTotalOutputVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_ClipStatusPlatformTotalOutputVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));

    }

    /**
     * 클립 연령별 등록 시간/월간/연간
     */
    public String callClipStatusAge(P_ClipStatusVo pClipStatusVo) {
        ProcedureVo procedureVo = new ProcedureVo(pClipStatusVo);
        ArrayList<P_ClipStatusAgeOutputVo> detailList = clipStatusDao.callClipStatusAge(procedureVo);
        P_ClipStatusAgeTotalOutputVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_ClipStatusAgeTotalOutputVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }
}
