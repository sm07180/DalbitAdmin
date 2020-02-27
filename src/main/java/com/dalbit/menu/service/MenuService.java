package com.dalbit.menu.service;

import com.dalbit.menu.dao.MenuDao;
import com.dalbit.menu.vo.RecommendVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class MenuService {

    @Autowired
    MenuDao menuDao;

    public List<RecommendVo> getRecommendList(RecommendVo recommendVo){
        return menuDao.getRecommendList(recommendVo);
    }
}
