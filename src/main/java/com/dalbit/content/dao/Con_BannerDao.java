package com.dalbit.content.dao;

import com.dalbit.content.vo.AttendanceBonusVo;
import com.dalbit.content.vo.AttendanceCalendarVo;
import com.dalbit.content.vo.AttendanceVo;
import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Con_BannerDao {

    @Transactional(readOnly = true)
    ArrayList<P_bannerListOutputVo> callContentsBannerList(P_bannerListInputVo pBannerListInputVo);

    @Transactional(readOnly = true)
    int callContentsBannerListCnt(P_bannerListInputVo pBannerListInputVo);

    @Transactional(readOnly = true)
    P_bannerDetailOutputVo callContentsBannerDetail(P_bannerDetailInputVo pBannerDetailInputVo);

    int callContentsBannerAdd(P_bannerInsertVo pBannerInsertVo);
    int callContentsBannerEdit(P_bannerUpdateVo pBannerUpdateVo);
    int callContentsBannerDelete(P_bannerDeleteVo pBannerDeleteVo);

}
