package com.dalbit.member.service;

import com.dalbit.member.dao.M_ConnectDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class M_ConnectService {

    @Autowired
    M_ConnectDao mConnectDao;
}
