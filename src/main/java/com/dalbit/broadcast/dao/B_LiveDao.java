package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.LiveListVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface B_LiveDao {

    List<LiveListVo> callLiveList(LiveListVo liveListVo);
    int callLiveList_cnt(LiveListVo liveListVo);
}
