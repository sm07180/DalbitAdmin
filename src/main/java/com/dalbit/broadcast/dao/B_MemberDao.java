package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.BroadcastHistroyVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface B_MemberDao {
    List<BroadcastHistroyVo> callListener_detail(BroadcastHistroyVo broadcastHistroyVo);
}
