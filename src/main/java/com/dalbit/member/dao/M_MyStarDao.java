package com.dalbit.member.dao;

import com.dalbit.member.vo.MyStarListVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface M_MyStarDao {

    List<MyStarListVo> getMyStarList();

}
