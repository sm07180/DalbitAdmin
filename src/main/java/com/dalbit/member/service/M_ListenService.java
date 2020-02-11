package com.dalbit.member.service;

import com.dalbit.member.dao.M_ListenDao;
import com.dalbit.member.vo.ListenListVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class M_ListenService {

    @Autowired
    M_ListenDao mListenDao;
    @Autowired
    GsonUtil gsonUtil;

    public List<ListenListVo> getListenList() {
        List<ListenListVo> list = mListenDao.getListenList();
        return list;
    }

    public List<ListenListVo> getListenHistory_detail(ListenListVo listenListVo) {
        List<ListenListVo> resultList = null;
        if(listenListVo.getTmp().equals("listenHistory")) {
            //청취기록
            resultList = mListenDao.getListenHistory_detail(listenListVo);
        }
        return resultList;
    }

}
