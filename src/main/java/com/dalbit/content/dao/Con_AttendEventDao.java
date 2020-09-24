package com.dalbit.content.dao;

import com.dalbit.content.vo.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Con_AttendEventDao {

    @Transactional(readOnly = true)
    ArrayList<AttendanceVo> selectAttendanceList(AttendanceVo attendanceVo);
    @Transactional(readOnly = true)
    int selectAttendanceListCnt(AttendanceVo attendanceVo);

    @Transactional(readOnly = true)
    List<AttendanceCalendarVo> selectAttendanceCalendarList(AttendanceCalendarVo attendanceCalendarVo);
    @Transactional(readOnly = true)
    AttendanceCalendarVo selectAttendanceWeekCalendarList(AttendanceCalendarVo attendanceCalendarVo);
    @Transactional(readOnly = true)
    AttendanceBonusVo selectAttendanceBonus(AttendanceBonusVo attendanceBonusVo);

    @Transactional(readOnly = true)
    int selectGiftconCnt(AttendanceGiftconVo attendanceGiftconVo);
    @Transactional(readOnly = true)
    List<AttendanceGiftconVo> selectGiftconList(AttendanceGiftconVo attendanceGiftconVo);

}
