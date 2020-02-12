package com.dalbit.member.service;

import com.dalbit.member.dao.M_BroadcastDao;
import com.dalbit.member.vo.BroadListVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class M_BroadcastService {

    @Autowired
    M_BroadcastDao mBroadcastDao;
    @Autowired
    GsonUtil gsonUtil;

    public List<BroadListVo> getBroadList() {
        List<BroadListVo> list = mBroadcastDao.getBroadList();
        return list;
    }
    public List<BroadListVo> getBroadHistory_detail(BroadListVo broadListVo){
        List<BroadListVo> resultList = mBroadcastDao.getBroadHistory_detail(broadListVo);
        return resultList;
    }
}
