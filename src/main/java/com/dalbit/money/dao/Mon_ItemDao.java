package com.dalbit.money.dao;

import com.dalbit.money.vo.Mon_ItemInputVo;
import com.dalbit.money.vo.Mon_ItemOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Mon_ItemDao {

    @Transactional(readOnly = true)
    int selectChangeItemCnt(Mon_ItemInputVo monItemInputVo);

    @Transactional(readOnly = true)
    ArrayList<Mon_ItemOutputVo> selectChangeItemList(Mon_ItemInputVo monItemInputVo);
    @Transactional(readOnly = true)
    Mon_ItemOutputVo selectChangeItemSummary(Mon_ItemInputVo monItemInputVo);
    @Transactional(readOnly = true)
    Mon_ItemOutputVo selectChangeItemModCnt(Mon_ItemInputVo monItemInputVo);
    @Transactional(readOnly = true)
    int selectChangeItemMemCnt(Mon_ItemInputVo monItemInputVo);

}
