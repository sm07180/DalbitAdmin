package com.dalbit.content.service;

import com.dalbit.content.dao.SitebanDao;
import com.dalbit.content.dao.ThemeDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class SitebanService {

    @Autowired
    SitebanDao dao;

}
