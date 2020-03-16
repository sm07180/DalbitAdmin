package com.dalbit.member.controller.rest;

import com.dalbit.common.vo.ImageVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.service.Mem_MemberService;
import com.dalbit.member.vo.procedure.*;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

    @PostMapping("list")
    public String list(P_MemberListInputVo pMemberListInputVo){
        String result = mMemberService.getMemberList(pMemberListInputVo);
        return result;
    }

    @PostMapping("info")
    public String info(P_MemberInfoInputVo pMemberInfoInputVo){
        String result = mMemberService.getMemberInfo(pMemberInfoInputVo);
        return result;
    }

    @PostMapping("adminMemoAdd")
    public String adminMemoAdd(P_MemberAdminMemoAddVo pMemberAdminMemoAddVo){
        String result = mMemberService.getMemberAdminMemoAdd(pMemberAdminMemoAddVo);
        return result;
    }

    @PostMapping("adminMemolist")
    public String adminMemolist(P_MemberAdminMemoListInputVo pMemberAdminMemoListInputVo){
        String result = mMemberService.getMemberAdminMemolist(pMemberAdminMemoListInputVo);
        return result;
    }

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
}
