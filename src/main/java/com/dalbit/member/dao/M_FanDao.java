package com.dalbit.member.dao;

import com.dalbit.member.vo.FanListVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface M_FanDao {

    List<FanListVo> callFanList(FanListVo fanListVo);
}
