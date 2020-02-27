package com.dalbit.member.dao;

import com.dalbit.member.vo.ListenListVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface M_ListenDao {

    List<ListenListVo> callListenList();

    List<ListenListVo> callListenHistory_detail(ListenListVo listenListVo);
    int callListenHistory_detail_cnt(ListenListVo listenListVo);

}
