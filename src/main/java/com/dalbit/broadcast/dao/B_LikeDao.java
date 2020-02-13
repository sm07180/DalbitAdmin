package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.LikeVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface B_LikeDao {

    List<LikeVo> callLike_detail(LikeVo likeVo);
}
