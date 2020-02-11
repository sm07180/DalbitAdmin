package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.B_StoryDao;
import com.dalbit.broadcast.vo.BroadcastHistroyVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class B_StoryService {

    @Autowired
    B_StoryDao bStoryDao;


    public List<BroadcastHistroyVo> getStoryHistory_detail(BroadcastHistroyVo broadcastHistroyVo) {
        List<BroadcastHistroyVo> list = bStoryDao.callStory_detail(broadcastHistroyVo);
        return list;
    }

}
