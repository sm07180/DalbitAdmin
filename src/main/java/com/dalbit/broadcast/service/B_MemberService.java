package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.B_MemberDao;
import com.dalbit.broadcast.vo.BroadcastHistroyVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class B_MemberService {

    @Autowired
    B_MemberDao bMemberDao;



    public List<BroadcastHistroyVo> getBroadcastHistory_detail(BroadcastHistroyVo broadcastHistroyVo) {
        List<BroadcastHistroyVo> list = null;

        if (broadcastHistroyVo.getTmp().equals("listener")) {
            list = bMemberDao.callListener_detail(broadcastHistroyVo);
        } else if (broadcastHistroyVo.getTmp().equals("fanHistory")) {
            list = bMemberDao.callListener_detail(broadcastHistroyVo);
        }

        return list;
    }
}
