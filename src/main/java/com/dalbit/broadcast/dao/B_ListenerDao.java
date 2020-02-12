package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.ListenerVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface B_ListenerDao {
    List<ListenerVo> callListener_detail(ListenerVo listenerVo);
}
