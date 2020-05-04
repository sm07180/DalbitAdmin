package com.dalbit.connect.service;


import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.common.vo.StatVo;
import com.dalbit.connect.dao.Con_LoginDao;
import com.dalbit.connect.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Con_LoginService {

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Con_LoginDao con_LoginDao;


    /**
     * 로그인 총계
     */

    public String callLoginLive(){
        ProcedureVo procedureVo = new ProcedureVo();
        con_LoginDao.callLoginLive(procedureVo);
        P_LoginLiveOutVo loginLive = new Gson().fromJson(procedureVo.getExt(), P_LoginLiveOutVo.class);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, loginLive));
    }


    /**
     * 로그인 총계
     * @param statVo
     * @return
     */
    public String callLoginTotal(StatVo statVo){
        ProcedureVo procedureVo = new ProcedureVo(statVo);
        List<P_LoginTotalOutDetailVo> detailList =  con_LoginDao.callLoginTotal(procedureVo);
        P_LoginTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginTotalOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 로그인 연령대별
     * @param statVo
     * @return
     */
    public String callLoginAge(StatVo statVo){
        ProcedureVo procedureVo = new ProcedureVo(statVo);
        List<P_LoginAgeOutDetailVo> detailList =  con_LoginDao.callLoginAge(procedureVo);
        P_LoginAgeOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginAgeOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }
    /**
     * 로그인 브라우저별
     * @param statVo
     * @return
     */
    public String callLoginBrowser(StatVo statVo){
        ProcedureVo procedureVo = new ProcedureVo(statVo);
        List<P_LoginBrowserOutDetailVo> detailList =  con_LoginDao.callLoginBrowser(procedureVo);
        P_LoginBrowserOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginBrowserOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }
}
