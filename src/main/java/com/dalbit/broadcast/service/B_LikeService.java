package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.B_LikeDao;
import com.dalbit.broadcast.vo.LikeVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class B_LikeService {

    @Autowired
    B_LikeDao bLikeDao;

    public List<LikeVo> getLikeHistory_detail(LikeVo likeVo) {
        List<LikeVo> list = bLikeDao.callLike_detail(likeVo);
        return list;
    }
}
