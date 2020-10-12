package com.dalbit.administrate.dao;

import com.dalbit.administrate.vo.*;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.member.vo.MemberVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Adm_TestDalByeolDao {

    @Transactional(readOnly = true)
    ArrayList<TestDalByeolListVo> getTestDalByeolList(TestIdVo testIdVo);

    @Transactional(readOnly = true)
    int getTestDalByeolList_totalCnt(TestIdVo testIdVo);

    @Transactional(readOnly = true)
    TestDalByeolListVo getTestDalByeolSummary1(TestIdVo testIdVo);

    @Transactional(readOnly = true)
    TestDalByeolListVo getTestDalByeolSummary2(TestIdVo testIdVo);


    @Transactional(readOnly = true)
    ArrayList<TestResourceSendListVo> getDalSendList(TestIdVo testIdVo);

    @Transactional(readOnly = true)
    int getDalSendList_totalCnt(TestIdVo testIdVo);

    @Transactional(readOnly = true)
    ArrayList<TestResourceSendListVo> getByeolSendList(TestIdVo testIdVo);

    @Transactional(readOnly = true)
    int getByeolSendList_totalCnt(TestIdVo testIdVo);
}