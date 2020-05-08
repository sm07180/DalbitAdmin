package com.dalbit.menu.dao;

import com.dalbit.menu.vo.RecommendVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface RecommendDao {

    @Transactional(readOnly = true)
    List<RecommendVo> getRecommendList(RecommendVo recommendVo);
}
