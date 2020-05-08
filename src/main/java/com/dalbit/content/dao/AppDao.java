package com.dalbit.content.dao;

import com.dalbit.content.vo.AppVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface AppDao {

    @Transactional(readOnly = true)
    List<AppVo> getAppVersionList(AppVo appVo);

    @Transactional(readOnly = true)
    int getAppVersionListCnt(AppVo appVo);

    @Transactional(readOnly = true)
    AppVo getListDetail(AppVo appVo);

    int addAppVersion(AppVo appVo);
    int updateOs(AppVo appVo);
//    int updateAppVersion(AppVo appVo);
//    int deleteAppVersion(AppVo appVo);
}
