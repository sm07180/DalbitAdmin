package com.dalbit.money.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.money.dao.Mon_ResourceDao;
import com.dalbit.money.vo.procedure.*;
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
public class Mon_ResourceService {

    @Autowired
    Mon_ResourceDao mon_ResourceDao;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    public String resourceInfo(P_ResourceInfoInPutVo pResourceInfoInPutVo){
        var result = new HashMap<String, Object>();
        ProcedureVo procedureVo = new ProcedureVo(pResourceInfoInPutVo);
        if(pResourceInfoInPutVo.getSlctResource() == 0){
            ArrayList<P_ResourceDetailByeolOutVo> detailList = mon_ResourceDao.callResourceDetail_byeol(procedureVo);
            P_ResourceTotalByeolOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_ResourceTotalByeolOutVo.class);
            if(Integer.parseInt(procedureVo.getRet()) <= 0){
                return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
            }
            result.put("totalInfo", totalInfo);
            result.put("detailList", detailList);
        }else{
            ArrayList<P_ResourceDetailDalOutVo> detailList = mon_ResourceDao.callResourceDetail_dal(procedureVo);
            P_ResourceTotalDalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_ResourceTotalDalOutVo.class);
            if(Integer.parseInt(procedureVo.getRet()) <= 0){
                return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
            }
            result.put("totalInfo", totalInfo);
            result.put("detailList", detailList);
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    public String memberDataList(P_ResourceInfoInPutVo pResourceInfoInPutVo){
        ProcedureVo procedureVo = new ProcedureVo(pResourceInfoInPutVo);
        ArrayList<P_memberDataListOutVo> listOutVo = mon_ResourceDao.callMemberDataList(procedureVo);
        P_memberDataListOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_memberDataListOutVo.class);

        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", listOutVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }


}
