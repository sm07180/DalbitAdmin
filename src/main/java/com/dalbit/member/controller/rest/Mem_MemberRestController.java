package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.ImageVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.service.Mem_MemberService;
import com.dalbit.member.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@RestController
@RequestMapping("rest/member/member")
public class Mem_MemberRestController {

    @Autowired
    Mem_MemberService mMemberService;
    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원 목록
     */
    @PostMapping("list")
    public String list(P_MemberListInputVo pMemberListInputVo){
        String result = mMemberService.getMemberList(pMemberListInputVo);
        return result;
    }

    /**
     * 회원 엑셀
     */
    @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model, P_MemberListInputVo pMemberListInputVo) throws GlobalException {

        Model resultModel = mMemberService.getListExcel(pMemberListInputVo, model);
        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);

        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    /**
     * 회원 정보
     */
    @PostMapping("info")
    public String info(P_MemberInfoInputVo pMemberInfoInputVo){
        String result = mMemberService.getMemberInfo(pMemberInfoInputVo);
        return result;
    }

    /**
     * 회원 정보 수정
     */
    @PostMapping("editor")
    public String editor(P_MemberEditorVo pMemberEditorVo){
        String result = "1";
        if(pMemberEditorVo.getPhotoUrl() != null){
            pMemberEditorVo.setReset_profileImage(new ImageVo(null, pMemberEditorVo.getMemSex(), pMemberEditorVo.getPhotoUrl()));
            pMemberEditorVo.setProfileImage(pMemberEditorVo.getReset_profileImage().getUrl().replace(pMemberEditorVo.getPhotoUrl(),""));
        }
        if(pMemberEditorVo.getNickName() != null){
            result = mMemberService.callNickNameCheck(new ProcedureVo(pMemberEditorVo.getNickName()));
        }
        if(result.equals("1")){
             result = mMemberService.getMemberEditor(pMemberEditorVo);
        }else{
            result = "0";
        }
        return result;
    }


    //------------------------------------------------------------------------
    /* 자세히 보기 */

    /**
     * 회원 관리자 메모 추가
     */
    @PostMapping("adminMemoAdd")
    public String adminMemoAdd(P_MemberAdminMemoAddVo pMemberAdminMemoAddVo){
        String result = mMemberService.getMemberAdminMemoAdd(pMemberAdminMemoAddVo);
        return result;
    }
    /**
     * 회원 관리자 메모 목록
     */
    @PostMapping("adminMemolist")
    public String adminMemolist(P_MemberAdminMemoListInputVo pMemberAdminMemoListInputVo){
        String result = mMemberService.getMemberAdminMemolist(pMemberAdminMemoListInputVo);
        return result;
    }
    /**
     * 회원 접속 정보 보기
     */
    @PostMapping("connect")
    public String connect(P_MemberConnectInputVo pMemberConnectInputVo){
        String result = mMemberService.getMemberConnect(pMemberConnectInputVo);
        return result;
    }
    /**
     * 회원 매니저 정보
     */
    @PostMapping("managerList")
    public String managerList(P_MemberManagerListInputVo pMemberManagerListInputVo){
        String result = mMemberService.getMemberManagerList(pMemberManagerListInputVo);
        return result;
    }
    /**
     * 회원 블랙리스트 정보
     */
    @PostMapping("blackList")
    public String blackList(P_MemberBlackListInputVo pMemberblackListInputVo){
        String result = mMemberService.getMemberBlackList(pMemberblackListInputVo);
        return result;
    }


    //-------------------------------------------------------------------------
}
