package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.service.Mem_MemberService;
import com.dalbit.member.vo.procedure.*;
import com.dalbit.util.DalbitUtil;
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
    Mem_MemberService mem_MemberService;
    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원 목록
     */
    @PostMapping("list")
    public String list(P_MemberListInputVo pMemberListInputVo){
        String result = mem_MemberService.getMemberList(pMemberListInputVo);
        return result;
    }

    /**
     * 회원 엑셀
     */
    @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model, P_MemberListInputVo pMemberListInputVo) throws GlobalException {

        Model resultModel = mem_MemberService.getListExcel(pMemberListInputVo, model);
        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);

        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    /**
     * 회원 정보
     */
    @PostMapping("info")
    public String info(P_MemberInfoInputVo pMemberInfoInputVo){
        String result = mem_MemberService.getMemberInfo(pMemberInfoInputVo);
        return result;
    }

    /**
     * 회원 정보수정 내역 보기
     */
    @PostMapping("editHist")
    public String editHist(P_MemberEditHistInputVo pMemberEditHistInputVo) {
        return mem_MemberService.callMemberEditHistory(pMemberEditHistInputVo);
    }

    /**
     * 회원 정보 수정
     */
    @PostMapping("editor")
    public String editor(P_MemberEditorVo pMemberEditorVo)throws GlobalException{
        String result;
        pMemberEditorVo.setNotiSms("0");
        if(pMemberEditorVo.getPhoneNum() != null) {
            if(DalbitUtil.isSmsPhoneNoChk(pMemberEditorVo.getPhoneNum())) {
                if(pMemberEditorVo.getPasswdReset() != null){
                    String password = DalbitUtil.randomValue("string", 4) + DalbitUtil.randomValue("e", 2) + DalbitUtil.randomValue("number", 4);
//                    String password = "123qweasd";
                    log.info("------------------------------------------------------------------------------");
                    log.info("password : " + password);
                    log.info("------------------------------------------------------------------------------");
                    pMemberEditorVo.setPasswdReset(password);
                    pMemberEditorVo.setNotiSms("1");
                }
            }else{
                return "0";
            }
        }
        result = mem_MemberService.getMemberEditor(pMemberEditorVo);
        return result;
    }

    /**
     * 회원 소셜아이디 변경
     */
    @PostMapping("socialId_edit")
    public String socialId_edit(P_MemberEditorVo pMemberEditorVo){
        String result = mem_MemberService.getMemberSocialIdEdit(pMemberEditorVo);
        return result;
    }

    /**
     * 회원 상태 정상 변경
     */
    @PostMapping("state_edit")
    public String state_edit(P_MemberEditorVo pMemberEditorVo){
        String result = mem_MemberService.getMemberStateEdit(pMemberEditorVo);
        return result;
    }

    /**
     * 회원 경고/정지
     */
    @PostMapping("report")
    public String report(P_MemberReportVo pMemberReportVo, HttpServletRequest request){
        pMemberReportVo.setIp(DalbitUtil.getIp(request));
        pMemberReportVo.setBrowser(DalbitUtil.getUserAgent(request));

        String result = mem_MemberService.getMemberReport(pMemberReportVo);
        return result;
    }


    //------------------------------------------------------------------------
    /* 자세히 보기 */

    /**
     * 회원 관리자 메모 추가
     */
    @PostMapping("adminMemoAdd")
    public String adminMemoAdd(P_MemberAdminMemoAddVo pMemberAdminMemoAddVo){
        String result = mem_MemberService.getMemberAdminMemoAdd(pMemberAdminMemoAddVo);
        return result;
    }
    /**
     * 회원 관리자 메모 목록
     */
    @PostMapping("adminMemolist")
    public String adminMemolist(P_MemberAdminMemoListInputVo pMemberAdminMemoListInputVo){
        String result = mem_MemberService.getMemberAdminMemolist(pMemberAdminMemoListInputVo);
        return result;
    }
    /**
     * 회원 접속 정보 보기
     */
    @PostMapping("connect")
    public String connect(P_MemberConnectInputVo pMemberConnectInputVo){
        String result = mem_MemberService.getMemberConnect(pMemberConnectInputVo);
        return result;
    }
    /**
     * 회원 매니저 정보
     */
    @PostMapping("managerList")
    public String managerList(P_MemberManagerListInputVo pMemberManagerListInputVo){
        String result = mem_MemberService.getMemberManagerList(pMemberManagerListInputVo);
        return result;
    }
    /**
     * 회원 블랙리스트 정보
     */
    @PostMapping("blackList")
    public String blackList(P_MemberBlackListInputVo pMemberblackListInputVo){
        String result = mem_MemberService.getMemberBlackList(pMemberblackListInputVo);
        return result;
    }


    //-------------------------------------------------------------------------
}
