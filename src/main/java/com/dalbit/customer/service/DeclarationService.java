package com.dalbit.customer.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.code.*;
import com.dalbit.customer.dao.DeclarationDao;
import com.dalbit.customer.vo.DeclareVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class DeclarationService {

    @Autowired
    DeclarationDao declarationDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    public List<DeclareVo> getDeclareList(DeclareVo declareVo) {
        List<DeclareVo> list = declarationDao.declareList(declareVo);
        int declareList_cnt = declarationDao.declareList_cnt(declareVo);
        list.get(0).setTotalCnt(declareList_cnt);
        return list;
    }

    /**
     * 선택 회원 정보
     * */
    public String getDeclareDetail(DeclareVo declareVo) {
        List<DeclareVo> list = declarationDao.getDeclareDetail(declareVo);
        String result;
        result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, list)));
        return result;
    }
}
