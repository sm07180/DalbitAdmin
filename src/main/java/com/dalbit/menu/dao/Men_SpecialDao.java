package com.dalbit.menu.dao;

import com.dalbit.menu.vo.SpecialReqVo;
import com.dalbit.menu.vo.SpecialVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface Men_SpecialDao {

    @Transactional(readOnly = true)
    List<SpecialReqVo> getReqSpecialList(SpecialReqVo specialReqVo);
    @Transactional(readOnly = true)
    int getReqSpecialListCnt(SpecialReqVo specialReqVo);

    @Transactional(readOnly = true)
    SpecialReqVo getReqSpecialDetail(SpecialReqVo specialReqVo);

    @Transactional(readOnly = true)
    int reqOk(SpecialReqVo specialReqVo);
    @Transactional(readOnly = true)
    int reqOkUpdate(SpecialReqVo specialReqVo);
    @Transactional(readOnly = true)
    int profileUpdate(SpecialReqVo specialReqVo);

    @Transactional(readOnly = true)
    List<SpecialVo> getSpecialList(SpecialVo specialVo);
    @Transactional(readOnly = true)
    int getSpecialListCnt(SpecialVo specialVo);

}
