package com.dalbit.customer.dao;

import com.dalbit.customer.vo.DeclareVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeclarationDao {
    List<DeclareVo> declareList(DeclareVo declareVo);
    int declareList_cnt(DeclareVo declareVo);

}
