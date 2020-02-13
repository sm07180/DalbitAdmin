package com.dalbit.member.dao;

import com.dalbit.member.vo.NoticeListVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface M_NoticeDao {


    List<NoticeListVo> callMyNoticeList(NoticeListVo noticeListVo);
    List<NoticeListVo> callBroadNoticeList(NoticeListVo noticeListVo);
}
