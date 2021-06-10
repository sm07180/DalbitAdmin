package com.dalbit.common.proc;

import com.dalbit.common.vo.SmsProcVO;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public interface SmsService {

    @Select("CALL rd_data.p_hpMsg_send(#{msgSlct}, #{sendPhone}, #{sendMemNo}, #{rcvPhone}, #{rcvMemId}, " +
            "#{titleConts}, #{msgBody}, #{atchFile}, #{rsrvDt}, #{tranSlct}, #{retVal})")
    int sendSms(SmsProcVO smsProcVO);

}
