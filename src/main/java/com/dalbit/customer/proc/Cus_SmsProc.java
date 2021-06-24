package com.dalbit.customer.proc;

import com.dalbit.customer.vo.SmsHistoryVo;
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

}
