package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.List;

@Getter
@Setter
public class P_MemberAdminMemoDelVo extends BaseVo {
    private List<HashMap> delList;
    private String mem_no;
}

