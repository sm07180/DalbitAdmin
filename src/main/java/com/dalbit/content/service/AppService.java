package com.dalbit.content.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.code.*;
import com.dalbit.content.dao.AppDao;
import com.dalbit.content.vo.AppVo;
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

        List<AppVo> appList = appDao.getAppVersionList(appVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, appList));

        return result;
    }
}
