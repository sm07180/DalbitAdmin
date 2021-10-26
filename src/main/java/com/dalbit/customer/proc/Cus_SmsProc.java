package com.dalbit.customer.proc;

import com.dalbit.customer.vo.SmsHistoryVo;
import com.dalbit.customer.vo.procedure.P_AgeLimitListInputVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Cus_SmsProc {

    @ResultMap({"ResultMap.integer", "ResultMap.SmsHistoryVo"})
    @Select("CALL rd_data.p_hpMsg_list(#{msgSlct}, #{tDate}, #{sendSlct}, #{tranSlct}, #{pageStart}, #{pageCnt})")
    List<Object> getSmsList(SmsHistoryVo smsHistoryVo);

    @ResultMap({"ResultMap.integer", "ResultMap.string", "ResultMap.PAgeLimitListOutputVo"})
    @Select("CALL rd_admin.sp_admin_member_certification_stop_list(#{pageNo}, #{pagePerCnt})")
    List<Object> getAgeLimitList(P_AgeLimitListInputVo pAgeLimitListInputVo);
}
