package com.dalbit.connect.service;


import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.common.vo.StatVo;
import com.dalbit.connect.dao.Con_UserDao;
import com.dalbit.connect.vo.procedure.P_UserCurrentInputVo;
import com.dalbit.connect.vo.procedure.P_UserCurrentOutputVo;
import com.dalbit.connect.vo.procedure.P_UserTotalOutDetailVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Con_UserService {

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Con_UserDao con_UserDao;

    /**
     * 현재 접속자 통계 총계
     * @return
     */
    public String callUserTotal(){
        ProcedureVo procedureVo = new ProcedureVo();
        con_UserDao.callUserTotal(procedureVo);
        P_UserTotalOutDetailVo detailList = new Gson().fromJson(procedureVo.getExt(), P_UserTotalOutDetailVo.class);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, detailList));
    }

    /**
     * 현재 접속자 통계 총계
     * @return
     */
    public String callUserCurrentUser(P_UserCurrentInputVo pUserCurrentInputVo){

        ProcedureVo procedureVo = new ProcedureVo(pUserCurrentInputVo);
        ArrayList<P_UserCurrentOutputVo> currentList = con_UserDao.callUserCurrent(procedureVo);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, currentList, new PagingVo(procedureVo.getRet())));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
        return result;
    }

}
