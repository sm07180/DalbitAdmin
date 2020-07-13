package com.dalbit.administrate.controller.rest;

import com.dalbit.administrate.service.Adm_TestIdService;
import com.dalbit.administrate.vo.AdminIdVo;
import com.dalbit.administrate.vo.TestIdListVo;
import com.dalbit.administrate.vo.TestIdVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.security.vo.InforexLoginUserInfoVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @Autowired
    ExcelService excelService;

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
    public String summary(SearchVo searchVo){
        List<TestIdVo> summaryList = admTestIdService.getTestIdSummary(searchVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, summaryList));
    }

    @PostMapping("/list")
    public String list(SearchVo searchVo){
        List<TestIdListVo> testIdList = admTestIdService.getTestIdList(searchVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, testIdList));
    }

    @PostMapping("/delete")
    public String delete(HttpServletRequest request){

        String memNosJson = request.getParameter("memNos");
        String[] memNos = new Gson().fromJson(memNosJson, String[].class);

        admTestIdService.deleteTestId(memNos);

        return gsonUtil.toJson(new JsonOutputVo(Status.삭제));
    }

    /**
     * 회원 엑셀
     */
    @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model, SearchVo searchVo) throws GlobalException {

        Model resultModel = admTestIdService.getListExcel(searchVo, model);
        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);

        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    @PostMapping("updateAdminId")
    public String updateAdminId(HttpServletRequest request, AdminIdVo adminIdVo){
        return admTestIdService.updateAdminId(adminIdVo);
    }
}
