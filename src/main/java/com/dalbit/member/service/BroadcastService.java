package com.dalbit.member.service;

import com.dalbit.member.dao.MemberDao;
import com.dalbit.member.vo.BroadListVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class BroadcastService {

    @Autowired
    MemberDao memberDao;
    @Autowired
    GsonUtil gsonUtil;

    public List<BroadListVo> getBroadList() {
        List<BroadListVo> list = memberDao.getBroadList();
        return list;
    }

}
