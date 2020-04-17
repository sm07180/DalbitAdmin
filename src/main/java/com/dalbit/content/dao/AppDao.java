package com.dalbit.content.dao;

import com.dalbit.content.vo.AppInsertVo;
import com.dalbit.content.vo.AppVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppDao {
    List<AppVo> getAppVersionList(AppVo appVo);
    int getAppVersionListCnt(AppVo appVo);
    AppVo getListDetail(AppVo appVo);
    int addAppVersion(AppInsertVo appInsertVo);
    int updateAppVersion(AppVo appVo);
    int deleteAppVersion(AppVo appVo);
}
