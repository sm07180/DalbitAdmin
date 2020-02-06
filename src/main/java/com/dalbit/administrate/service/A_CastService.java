package com.dalbit.administrate.service;


import com.dalbit.administrate.dao.A_CastDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class A_CastService {

    @Autowired
    A_CastDao aCastDao;

}
