package com.dalbit.content.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.code.*;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.dao.AppDao;
import com.dalbit.content.vo.AppVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class AppService {

    @Autowired
    AppDao appDao;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 앱버전 리스트 조회
     */
    public String getAppVersionList(AppVo appVo) {
        int getAppVersionListCnt = appDao.getAppVersionListCnt(appVo);
        appVo.setTotalCnt(getAppVersionListCnt);
        List<AppVo> appList = appDao.getAppVersionList(appVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, appList, new PagingVo(appVo.getTotalCnt())));

        return result;
    }

    /**
     * 앱버전 리스트 상세 조회
     */
    public String getListDetail(AppVo appVo) {
        AppVo detail = appDao.getListDetail(appVo);
        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, detail));

        return result;
    }
}
