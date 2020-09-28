package com.dalbit.content.dao;

import com.dalbit.content.vo.ChuseokEventVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Con_ChuseokEventDao {

    @Transactional(readOnly = true)
    ArrayList<ChuseokEventVo> selectFreeDalList(ChuseokEventVo chuseokEventVo);

    @Transactional(readOnly = true)
    int selectFreeDalListCnt(ChuseokEventVo chuseokEventVo);

}
