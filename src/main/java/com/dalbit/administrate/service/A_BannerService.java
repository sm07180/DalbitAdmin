package com.dalbit.administrate.service;


import com.dalbit.administrate.dao.A_BannerDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class A_BannerService {

    @Autowired
    A_BannerDao aBannerDao;

}
