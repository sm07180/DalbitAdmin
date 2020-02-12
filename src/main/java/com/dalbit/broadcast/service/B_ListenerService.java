package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.B_ListenerDao;
import com.dalbit.broadcast.vo.ListenerVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class B_ListenerService {

    @Autowired
    B_ListenerDao bListenerDao;

    public List<ListenerVo> getListenerHistory_detail(ListenerVo listenerVo) {
        List<ListenerVo> list = bListenerDao.callListener_detail(listenerVo);
        return list;
    }
}
