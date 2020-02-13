package com.dalbit.member.service;

import com.dalbit.member.dao.M_NoticeDao;
import com.dalbit.member.vo.NoticeListVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class M_NoticeService {

    @Autowired
    M_NoticeDao mNoticeDao;

    public List<NoticeListVo> getMyNoticeList(NoticeListVo noticeListVo) {
        List<NoticeListVo> list = mNoticeDao.callMyNoticeList(noticeListVo);
        return list;
    }
    public List<NoticeListVo> getBroadNoticeList(NoticeListVo noticeListVo) {
        List<NoticeListVo> list = mNoticeDao.callBroadNoticeList(noticeListVo);
        return list;
    }
}
