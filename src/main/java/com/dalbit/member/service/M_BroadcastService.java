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
        List<BroadListVo> list = mBroadcastDao.callBroadList();
        return list;
    }
    public List<BroadListVo> getBroadHistory_detail(BroadListVo broadListVo){
        List<BroadListVo> resultList = mBroadcastDao.callBroadHistory_detail(broadListVo);
        int total = mBroadcastDao.callBroadHistory_detail_cnt(broadListVo);
        log.info("total : " + total);
        if(resultList.size() > 0) {
            resultList.get(0).setTotalCnt(total);
        }
        return resultList;
    }
}
