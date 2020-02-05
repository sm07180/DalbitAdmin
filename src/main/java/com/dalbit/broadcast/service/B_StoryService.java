package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.B_StoryDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class B_StoryService {

    @Autowired
    B_StoryDao bStoryDao;

}
