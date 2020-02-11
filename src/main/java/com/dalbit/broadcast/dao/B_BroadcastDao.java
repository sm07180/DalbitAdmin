package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.BroadcastListVo;
import com.dalbit.broadcast.vo.BroadcastTypeListVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface B_BroadcastDao {

    List<BroadcastTypeListVo> callbBroadcastTypeList(BroadcastTypeListVo broadcastTypeListVo);
    List<BroadcastListVo> getBroadcastList(BroadcastListVo broadcastListVo);
}
