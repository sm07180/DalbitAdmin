package com.dalbit.status.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.status.dao.Sta_AppVersionDao;
import com.dalbit.status.vo.procedure.P_AppVersionVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dalbit.common.code.Status;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Sta_AppVersionService {

    @Autowired
    Sta_AppVersionDao sta_appVersionDao;

    @Autowired
    GsonUtil gsonUtil;

//    /**
//     * 앱 버전 별 사용자 수
//     */
//    public String selectVersionUser(P_AppVersionVo pAppVersionVo) {
//
//        pAppVersionVo.setSelectVersionCount(4);
//
//        // AOS
//        pAppVersionVo.setOs(1);
//        int aosTotUsers = sta_appVersionDao.selectTotalUsers(pAppVersionVo);
//        int aosVersionUsers = sta_appVersionDao.selectVersionUsersSum(pAppVersionVo);
//        ArrayList<P_AppVersionVo> aosList = sta_appVersionDao.selectAppVersionUsers(pAppVersionVo);
//
//        // IOS
//        pAppVersionVo.setOs(2);
//        int iosTotUsers = sta_appVersionDao.selectTotalUsers(pAppVersionVo);
//        int iosVersionUsers = sta_appVersionDao.selectVersionUsersSum(pAppVersionVo);
//        ArrayList<P_AppVersionVo> iosList = sta_appVersionDao.selectAppVersionUsers(pAppVersionVo);
//
//
//        HashMap<String, Object> result = new HashMap<>();
//        result.put("aosList", aosList);
//        result.put("iosList", iosList);
//        result.put("aosTotUsers", aosTotUsers);
//        result.put("iosTotUsers", iosTotUsers);
//        result.put("aosVersionUsers", aosVersionUsers);
//        result.put("iosVersionUsers", iosVersionUsers);
//
//        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
//    }

    /**
     * 빌드번호 별 사용자 수
     */
    public String selectBuildUser(P_AppVersionVo pAppVersionVo) {
        pAppVersionVo.setSelectVersionCount(4);

        // AOS
        pAppVersionVo.setOs(1);
        int aosTotUsers = sta_appVersionDao.selectTotalUsers(pAppVersionVo);
        int aosBuildUser = sta_appVersionDao.selectBuildUserSum(pAppVersionVo);
        ArrayList<P_AppVersionVo> aosList = sta_appVersionDao.selectAppBuildUsers(pAppVersionVo);

        // IOS
        pAppVersionVo.setOs(2);
        int iosTotUsers = sta_appVersionDao.selectTotalUsers(pAppVersionVo);
        int iosBuildUser = sta_appVersionDao.selectBuildUserSum(pAppVersionVo);
        ArrayList<P_AppVersionVo> iosList = sta_appVersionDao.selectAppBuildUsers(pAppVersionVo);
        HashMap<String, Object> result = new HashMap<>();
        result.put("aosList", aosList);
        result.put("iosList", iosList);
        result.put("aosTotUsers", aosTotUsers);
        result.put("iosTotUsers", iosTotUsers);
        result.put("aosBuildUser", aosBuildUser);
        result.put("iosBuildUser", iosBuildUser);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 현재 마켓 노출 버전
     */
    public String selectMarketVersion(P_AppVersionVo pAppVersionVo) {
        pAppVersionVo.setOs(1);
        List<P_AppVersionVo> aosMarketList = sta_appVersionDao.selectMarketVersion(pAppVersionVo);

        pAppVersionVo.setOs(2);
        List<P_AppVersionVo> iosMarketList = sta_appVersionDao.selectMarketVersion(pAppVersionVo);

        HashMap<String, Object> result = new HashMap<>();
        result.put("aosMarketList", aosMarketList);
        result.put("iosMarketList", iosMarketList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 총 리스트 조회
     */
    public String selectTotalList(P_AppVersionVo pAppVersionVo) {
        ArrayList<P_AppVersionVo> totalList = sta_appVersionDao.selectTotalList(pAppVersionVo);
        int totalCnt = sta_appVersionDao.selectTotalListCnt(pAppVersionVo);
        pAppVersionVo.setTotalCnt(totalCnt);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, totalList, new PagingVo(pAppVersionVo.getTotalCnt(), pAppVersionVo.getPageStart(), pAppVersionVo.getPageCnt())));
    }
}
