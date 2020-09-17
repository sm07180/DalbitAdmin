package com.dalbit.clip.service;

import com.dalbit.clip.dao.Cli_ClipStatusDao;
import com.dalbit.clip.vo.procedure.P_ClipStatusGiftOutputVo;
import com.dalbit.clip.vo.procedure.P_ClipStatusGiftTotalOutputVo;
import com.dalbit.clip.vo.procedure.P_ClipStatusVo;
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


}
