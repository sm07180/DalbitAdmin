package com.dalbit.customer.dao;

import com.dalbit.customer.vo.BlockAdmVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Cus_BlockAdmDao {

    @Transactional(readOnly = true)
    ArrayList<BlockAdmVo> selectBlockList(BlockAdmVo blockAdmVo);

    @Transactional(readOnly = true)
    int selectBlockListCnt(BlockAdmVo blockAdmVo);

    @Transactional(readOnly = true)
    BlockAdmVo selectBlockDetail(BlockAdmVo blockAdmVo);
}
