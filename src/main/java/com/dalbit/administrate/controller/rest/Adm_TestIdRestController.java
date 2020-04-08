package com.dalbit.administrate.controller.rest;

import com.dalbit.administrate.service.Adm_TestIdService;
import com.dalbit.administrate.vo.TestIdListVo;
import com.dalbit.administrate.vo.TestIdVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.security.vo.InforexLoginUserInfoVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/rest/administrate/testId")
public class Adm_TestIdRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    CommonService commonService;
    @Autowired
    Adm_TestIdService admTestIdService;

    @PostMapping("/insert")
    public String list(TestIdVo testIdVo) throws GlobalException {
        MemberVo memberVo = admTestIdService.getMemberInfo(testIdVo);
        if(DalbitUtil.isEmpty(memberVo)){
            throw new GlobalException(Status.테스트아이디_회원검색_결과없음);
        }

        testIdVo.setMem_no(memberVo.getMemNo());
        List<TestIdVo> testIdVoList = admTestIdService.getTestIdInfo(testIdVo);
        if(0 < testIdVoList.size()){
            throw new GlobalException(Status.테스트아이디_이미등록된테스트아이디);
        }

        InforexLoginUserInfoVo inforexLoginUserInfoVo = MemberVo.getUserInfo();
        testIdVo.setEmp_no(inforexLoginUserInfoVo.getEmp_no());
        testIdVo.setEmp_name(inforexLoginUserInfoVo.getName());
        admTestIdService.insertTestId(testIdVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.생성));
    }

    @PostMapping("/summary")
    public String summary(){
        List<TestIdVo> summaryList = admTestIdService.getTestIdSummary();
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, summaryList));
    }

    @PostMapping("/list")
    public String list(SearchVo searchVo){
        List<TestIdListVo> testIdList = admTestIdService.getTestIdList(searchVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, testIdList));
    }

}
