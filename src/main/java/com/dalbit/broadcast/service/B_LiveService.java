package com.dalbit.broadcast.service;

import com.dalbit.broadcast.dao.B_LiveDao;
import com.dalbit.broadcast.vo.LiveListVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class B_LiveService {

    @Autowired
    B_LiveDao bLiveDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 방송 list 목록
     */
    public List<LiveListVo> callLiveList(LiveListVo liveListVo){
        List<LiveListVo> list = bLiveDao.callLiveList(liveListVo);

        int total = bLiveDao.callLiveList_cnt(liveListVo);
        log.info("total : " + total);
        if(list.size() > 0) {
            list.get(0).setTotalCnt(total);
        }

        return list;
    }
}
