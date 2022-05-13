package com.dalbit.schelduler.proc;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface LuckChat {
    @ResultMap({"ResultMap.RewardItemInfo", "ResultMap.RewardUserInfo"})
    @Select("CALL rd_data.p_dalla_lucky_chat_sel(#{theDate}, #{theSeq})")
    List<Object> getLuckyChatInfo(@Param(value = "theDate") String theDate, @Param(value = "theSeq") Integer theSeq);


    @Select("CALL rd_data.p_dalla_lucky_chat_com_ins(#{theDate}, #{theSeq}, #{memNo}, #{preCode}, #{preSlct})")
    Integer putLuckyChatIns(@Param(value = "theDate") String theDate, @Param(value = "theSeq") Integer theSeq, @Param(value = "memNo") String memNo, @Param(value = "preCode") String preCode, @Param(value = "preSlct") String preSlct);

}
