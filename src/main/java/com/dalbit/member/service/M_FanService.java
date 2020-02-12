package com.dalbit.member.service;

import com.dalbit.member.dao.M_FanDao;
import com.dalbit.member.vo.FanListVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class M_FanService {

    @Autowired
    M_FanDao mFanDao;
    @Autowired
    GsonUtil gsonUtil;

    public List<FanListVo> getFanList(FanListVo fanListVo) {
        List<FanListVo> list = mFanDao.callFanList(fanListVo);
        return list;
    }
}
