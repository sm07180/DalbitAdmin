package com.dalbit.administrate.dao;

import com.dalbit.administrate.vo.TestIdListVo;
import com.dalbit.administrate.vo.TestIdVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.member.vo.MemberVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface Adm_TestIdDao {

    @Transactional(readOnly = true)
    MemberVo getMemberInfo(TestIdVo testIdVo);

    @Transactional(readOnly = true)
    List<TestIdVo> getTestIdInfo(TestIdVo testIdVo);

    int insertTestId(TestIdVo testIdVo);

    @Transactional(readOnly = true)
    List<TestIdVo> getTestIdSummary();

    @Transactional(readOnly = true)
    List<TestIdListVo> getTestIdList(SearchVo searchVo);

    void deleteTestId(String[] memNos);
}
