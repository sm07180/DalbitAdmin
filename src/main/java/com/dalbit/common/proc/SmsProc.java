package com.dalbit.common.proc;

import com.dalbit.common.vo.SmsProcVO;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public interface SmsProc {

    @Select("CALL rd_data.p_hpMsg_send(#{msgSlct}, #{sendPhone}, #{sendMemNo}, #{rcvPhone}, #{rcvMemId}, " +
            "#{titleConts}, #{msgBody}, #{atchFile}, #{rsrvDt}, #{tranSlct}, #{retVal})")
    int sendSms(SmsProcVO smsProcVO);

    @Select("CALL rd_data.p_hpMsg_mem_target_send(#{msgSlct}, #{testYn}, #{sendPhone}, " +
            "#{titleConts}, #{msgBody}, #{atchFile}, #{rsrvDt}, #{tranSlct})")
    int sendSmsBroadcast(SmsProcVO smsProcVO);

}
