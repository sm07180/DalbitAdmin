package com.dalbit.content.dao;

import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface BannerDao {
    ArrayList<P_bannerListOutputVo> callContentsBannerList(P_bannerListInputVo pBannerListInputVo);
    int callContentsBannerListCnt(P_bannerListInputVo pBannerListInputVo);
    P_bannerDetailOutputVo callContentsBannerDetail(P_bannerDetailInputVo pBannerDetailInputVo);
    int callContentsBannerAdd(P_bannerInsertVo pBannerInsertVo);
    int callContentsBannerEdit(P_bannerUpdateVo pBannerUpdateVo);
    int callContentsBannerDelete(P_bannerDeleteVo pBannerDeleteVo);
    
}
