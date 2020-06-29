package com.dalbit.status.dao;

import com.dalbit.status.vo.procedure.P_AppVersionVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Repository
public interface Sta_AppVersionDao {

    @Transactional(readOnly = true)
    int selectTotalUsers(P_AppVersionVo pAppVersionVo);

//    @Transactional(readOnly = true)
//    int selectVersionUsersSum(P_AppVersionVo pAppVersionVo);
//
//    @Transactional(readOnly = true)
//    ArrayList<P_AppVersionVo> selectAppVersionUsers(P_AppVersionVo pAppVersionVo);

    @Transactional(readOnly = true)
    int selectBuildUserSum(P_AppVersionVo pAppVersionVo);

    @Transactional(readOnly = true)
    ArrayList<P_AppVersionVo> selectAppBuildUsers(P_AppVersionVo pAppVersionVo);

    @Transactional(readOnly = true)
    List<P_AppVersionVo> selectMarketVersion(P_AppVersionVo pAppVersionVo);

    @Transactional(readOnly = true)
    ArrayList<P_AppVersionVo> selectTotalList(P_AppVersionVo pAppVersionVo);

    @Transactional(readOnly = true)
    int selectTotalListCnt(P_AppVersionVo pAppVersionVo);
}
