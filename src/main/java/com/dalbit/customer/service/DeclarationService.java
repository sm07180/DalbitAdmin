package com.dalbit.customer.service;

import com.dalbit.customer.dao.DeclarationDao;
import com.dalbit.customer.vo.DeclareVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class DeclarationService {

    @Autowired
    DeclarationDao declarationDao;

    public List<DeclareVo> getDeclareList(DeclareVo declareVo) {
        List<DeclareVo> list = declarationDao.declareList(declareVo);
        int declareList_cnt = declarationDao.declareList_cnt(declareVo);
        list.get(0).setTotalCnt(declareList_cnt);
        return list;
    }
}
