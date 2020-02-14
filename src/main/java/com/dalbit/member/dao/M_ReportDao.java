package com.dalbit.member.dao;

import com.dalbit.member.vo.ReportListVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface M_ReportDao {
    List<ReportListVo> callReportList(ReportListVo reportListVo);
}
