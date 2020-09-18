package com.dalbit.common.vo.procedure;

import com.dalbit.common.vo.request.ErrorLogVo;
import com.dalbit.member.vo.MemberVo;
import lombok.Getter;
import lombok.Setter;

import javax.servlet.http.HttpServletRequest;

@Getter @Setter
public class P_ErrorLogVo {

    private String mem_no;
    private String os;
    private String dtype;
    private String ctype;
    private String desc;
    public P_ErrorLogVo(){}
    public P_ErrorLogVo(ErrorLogVo errorLogVo, HttpServletRequest request){
        setMem_no(MemberVo.getMyMemNo());
        setOs(errorLogVo.getOs());
        setDtype(errorLogVo.getDataType());
        setCtype(errorLogVo.getCommandType());
        setDesc(errorLogVo.getDesc());
    }

}