package com.dalbit.content.dao;

import com.dalbit.content.vo.AppVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppDao {
    List<AppVo> getAppVersionList(AppVo appVo);
}
