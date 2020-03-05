package com.dalbit.content.service;

import com.dalbit.content.dao.BannerDao;
import com.dalbit.content.dao.PushDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class BannerService {

    @Autowired
    BannerDao dao;

}
