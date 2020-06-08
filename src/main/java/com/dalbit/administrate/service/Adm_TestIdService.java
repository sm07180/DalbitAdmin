package com.dalbit.administrate.service;

import com.dalbit.administrate.dao.Adm_AuthorityDao;
import com.dalbit.administrate.dao.Adm_TestIdDao;
import com.dalbit.administrate.vo.TestIdListVo;
import com.dalbit.administrate.vo.TestIdVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.MenuAuthVo;
import com.dalbit.common.vo.MenuVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.inforex.vo.InforexDutyCode;
import com.dalbit.inforex.vo.InforexMember;
import com.dalbit.inforex.vo.InforexPosCode;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.InforexApiUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
public class Adm_TestIdService {

    @Autowired
    Adm_TestIdDao admTestIdDao;

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    public MemberVo getMemberInfo(TestIdVo testIdVo){
        MemberVo memberInfo = admTestIdDao.getMemberInfo(testIdVo);
        return memberInfo;
    }

    public List<TestIdVo> getTestIdInfo(TestIdVo testIdVo){
        List<TestIdVo> testIdVoList = admTestIdDao.getTestIdInfo(testIdVo);
        return testIdVoList;
    }

    public int insertTestId(TestIdVo testIdVo){
        int result = admTestIdDao.insertTestId(testIdVo);
        admTestIdDao.insertTestId_history(testIdVo);

        // 내부직원 테스트 여부 1 update
        testIdVo.setInner(1);
        result = admTestIdDao.updateInner(testIdVo);
        return result;
    }

    public List<TestIdVo> getTestIdSummary(){
        List<TestIdVo> testIdSummary = admTestIdDao.getTestIdSummary();
        return testIdSummary;
    }

    public List<TestIdListVo> getTestIdList(SearchVo searchVo){
        List<TestIdListVo> testIdList = admTestIdDao.getTestIdList(searchVo);
        return testIdList;
    }

    public void deleteTestId(String[] memNos){
        admTestIdDao.deleteTestId(memNos);
        // 내부직원 테스트 여부 0 update
        TestIdVo testIdVo = new TestIdVo();
        testIdVo.setMem_no(memNos[0]);
        testIdVo.setInner(0);
        admTestIdDao.updateInner(testIdVo);
       }
}
