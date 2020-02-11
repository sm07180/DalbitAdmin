package com.dalbit.member.service;

import com.dalbit.member.dao.M_BroadcastDao;
import com.dalbit.member.vo.BroadListVo;
import com.dalbit.member.vo.MemberBroadcastHistoryListVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class M_BroadcastService {

    @Autowired
    M_BroadcastDao mBroadcastDao;
    @Autowired
    GsonUtil gsonUtil;

    public List<BroadListVo> getBroadList() {
        List<BroadListVo> list = mBroadcastDao.getBroadList();
        return list;
    }


    public List<MemberBroadcastHistoryListVo> getMemberHistory_detail(MemberBroadcastHistoryListVo memberBroadcastHistoryListVo){
//        List<MemberBroadcastHistoryListVo> list = mMemberDao.getMemberHistory_detail(MemberBroadcastHistoryListVo);
//        ProcedureVo procedureVo = new ProcedureVo();
//        procedureVo.setData(list);
//        String result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, procedureVo.getData())));
//        log.info(" ### 호출결과 ###" + result);
        return mBroadcastDao.getMemberHistory_detail(memberBroadcastHistoryListVo);
    }

}
