package com.dalbit.administrate.dao;

import com.dalbit.administrate.vo.TestIdListVo;
import com.dalbit.administrate.vo.TestIdVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.member.vo.MemberVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Adm_TestIdDao {

    MemberVo getMemberInfo(TestIdVo testIdVo);
    List<TestIdVo> getTestIdInfo(TestIdVo testIdVo);
    int insertTestId(TestIdVo testIdVo);
    List<TestIdVo> getTestIdSummary();
    List<TestIdListVo> getTestIdList(SearchVo searchVo);
}
