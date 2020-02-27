package com.dalbit.menu.dao;

import com.dalbit.broadcast.vo.LikeVo;
import com.dalbit.menu.vo.RecommendVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDao {

    List<RecommendVo> getRecommendList(RecommendVo recommendVo);
}
