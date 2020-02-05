package com.dalbit.member.service;

import com.dalbit.member.dao.M_ListenDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class M_ListenService {

    @Autowired
    M_ListenDao mListenDao;
}
