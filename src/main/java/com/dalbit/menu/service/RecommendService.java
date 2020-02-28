package com.dalbit.menu.service;

import com.dalbit.menu.dao.RecommendDao;
import com.dalbit.menu.vo.RecommendVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class RecommendService {

    @Autowired
    RecommendDao recommendDao;

    public List<RecommendVo> getRecommendList(RecommendVo recommendVo){
        return recommendDao.getRecommendList(recommendVo);
    }
}
