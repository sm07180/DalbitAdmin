package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.ManegerVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface B_ManegerDao {
    List<ManegerVo> callManeger_detail(ManegerVo ManegerVo);
}
