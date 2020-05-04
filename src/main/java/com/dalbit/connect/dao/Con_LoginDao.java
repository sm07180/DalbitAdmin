package com.dalbit.connect.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.connect.vo.procedure.P_LoginAgeOutDetailVo;
import com.dalbit.connect.vo.procedure.P_LoginBrowserOutDetailVo;
import com.dalbit.connect.vo.procedure.P_LoginLiveOutVo;
import com.dalbit.connect.vo.procedure.P_LoginTotalOutDetailVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Con_LoginDao {

    List<P_LoginLiveOutVo> callLoginLive(ProcedureVo procedureVo);
    List<P_LoginTotalOutDetailVo> callLoginTotal(ProcedureVo procedureVo);
    List<P_LoginAgeOutDetailVo> callLoginAge(ProcedureVo procedureVo);
    List<P_LoginBrowserOutDetailVo> callLoginBrowser(ProcedureVo procedureVo);

}
