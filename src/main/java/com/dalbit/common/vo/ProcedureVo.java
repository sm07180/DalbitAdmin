package com.dalbit.common.vo;

import com.dalbit.util.DalbitUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * Procedure 조회를 위한 VO
 */
@Getter
@Setter
@ToString
public class ProcedureVo {

    public ProcedureVo(){}

    public ProcedureVo(Object paramVo){
        setData(DalbitUtil.uniDecode(new Gson().toJson(paramVo)));
    }

    public ProcedureVo(Object paramVo, boolean isHtmlEscape){
        if(isHtmlEscape){
            setData(new GsonBuilder().disableHtmlEscaping().create().toJson(paramVo).replace("\\\"", "'"));
        }else{
            setData(new Gson().toJson(paramVo));
        }

    }

    public ProcedureVo(String nickNm){
        setNickName(nickNm);
    }

    public ProcedureVo(String phoneNo, String password){
        setPhoneNo(phoneNo);
        setPassword(password);
    }

    private Object data;
    private Object box;
    private String ret;
    private String ext;
    private String phoneNo;
    private String password;
    private String nickName;
}
