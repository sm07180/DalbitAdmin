package com.dalbit.content.dao;

import com.dalbit.content.vo.SitebanVo;
import org.springframework.stereotype.Repository;

@Repository
public interface SitebanDao {
    public SitebanVo selectBanword();

    public int updateBanword(SitebanVo sitebanVo);
}
