package com.dalbit.member.dao;

import com.dalbit.member.vo.BroadListVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface M_BroadcastDao {

    List<BroadListVo> getBroadList();

}
