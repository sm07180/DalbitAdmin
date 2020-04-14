package com.dalbit.content.service;

import com.dalbit.content.dao.SitebanDao;
import com.dalbit.content.vo.SitebanVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class SitebanService {

    @Autowired
    SitebanDao sitebanDao;

    public SitebanVo selectBanword(){
        SitebanVo sitebanVo = sitebanDao.selectBanword();

        sitebanVo.getBan_word();
        sitebanVo.getCount();

        return sitebanVo;
    }

    public int updateBanword(SitebanVo sitebanVo){
        return sitebanDao.updateBanword(sitebanVo);
    }
}
