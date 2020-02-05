package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.BroadListVo;
import com.dalbit.member.vo.MemberListVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BroadcastDao {

    List<BroadListVo> getBroadList();

}
