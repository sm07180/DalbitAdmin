package com.dalbit.member.service;

import com.dalbit.member.dao.M_MyStarDao;
import com.dalbit.member.vo.MyStarListVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class M_MyStarService {

    @Autowired
    M_MyStarDao mMyStarDao;
    @Autowired
    GsonUtil gsonUtil;

    public List<MyStarListVo> getMyStarList(MyStarListVo myStarListVo) {
        List<MyStarListVo> list = mMyStarDao.getMyStarList(myStarListVo);
        return list;
    }

}
