package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.StoryVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface B_StoryDao {
    List<StoryVo> callStory_detail(StoryVo storyVo);
}
