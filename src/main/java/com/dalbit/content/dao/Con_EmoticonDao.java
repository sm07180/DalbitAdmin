package com.dalbit.content.dao;

import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Con_EmoticonDao {

    @Transactional(readOnly = true)
    ArrayList<P_bannerListOutputVo> callContentsInssaticonList(P_bannerListInputVo pBannerListInputVo);

    @Transactional(readOnly = true)
    int callContentsInssaticonListCnt(P_bannerListInputVo pBannerListInputVo);

    @Transactional(readOnly = true)
    P_bannerDetailOutputVo callContentsInssaticonDetail(P_bannerDetailInputVo pBannerDetailInputVo);

    int callContentsInssaticonAdd(P_bannerInsertVo pBannerInsertVo);
    int callContentsInssaticonEdit(P_bannerUpdateVo pBannerUpdateVo);
    int callContentsInssaticonDelete(P_bannerDeleteVo pBannerDeleteVo);
    
}
