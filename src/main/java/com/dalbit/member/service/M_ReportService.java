package com.dalbit.member.service;

import com.dalbit.member.dao.M_ReportDao;
import com.dalbit.member.vo.ReportListVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class M_ReportService {

    @Autowired
    M_ReportDao mReportDao;

    public List<ReportListVo> getReportList(ReportListVo reportListVo) {
        List<ReportListVo> list = mReportDao.callReportList(reportListVo);
        return list;
    }
}
