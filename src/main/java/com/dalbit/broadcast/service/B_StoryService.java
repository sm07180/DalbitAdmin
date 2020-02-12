package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.B_StoryDao;
import com.dalbit.broadcast.vo.StoryVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class B_StoryService {

    @Autowired
    B_StoryDao bStoryDao;


    public List<StoryVo> getStoryHistory_detail(StoryVo storyVo) {
        List<StoryVo> list = bStoryDao.callStory_detail(storyVo);
        return list;
    }

}
