package com.dalbit.member.dao;

import com.dalbit.member.vo.procedure.P_MemberBanwordInputVo;
import com.dalbit.member.vo.procedure.P_MemberBanwordOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Mem_BanwordDao {

    ArrayList<P_MemberBanwordOutputVo> callBanwordHistory(P_MemberBanwordInputVo pMemberBanwordInputVo);

}
