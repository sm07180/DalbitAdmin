package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.B_ManegerDao;
import com.dalbit.broadcast.vo.ManegerVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class B_ManegerService {

    @Autowired
    B_ManegerDao bManegerDao;

    public List<ManegerVo> getManegerHistory_detail(ManegerVo manegerVo) {
        List<ManegerVo> list = bManegerDao.callManeger_detail(manegerVo);
        return list;
    }
}
