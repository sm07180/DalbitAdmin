package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.dao.Con_AttendEventDao;
import com.dalbit.content.vo.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

@Slf4j
@Service
public class Con_AttendEventService {

    @Autowired
    ExcelService excelService;
    @Autowired
    Con_AttendEventDao con_attendEventDao;
    @Autowired
    Mem_MemberDao memMemberDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;



    /*======================= 출석 체크 이벤트 ======================= */

    /**
     * 출석 이벤트 리스트 조회
     */
    public String selectAttendanceList(AttendanceVo attendanceVo) {
        List<AttendanceVo> list = con_attendEventDao.selectAttendanceList(attendanceVo);
        int totalCnt = con_attendEventDao.selectAttendanceListCnt(attendanceVo);
        attendanceVo.setTotalCnt(totalCnt);

        for(int i=0; i<list.size(); i++) {
            MemberVo outVo = memMemberDao.getMemberInfo(list.get(i).getMem_no());
            if(!DalbitUtil.isEmpty(outVo)) {
                list.get(i).setMem_sex(outVo.getMem_sex());
                list.get(i).setMem_birth_year(outVo.getMem_birth_year());
                list.get(i).setMem_birth_month(outVo.getMem_birth_month());
                list.get(i).setMem_birth_day(outVo.getMem_birth_day());
            }
        }

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(attendanceVo.getTotalCnt(), attendanceVo.getPageStart(), attendanceVo.getPageCnt())));

        return result;
    }

    public String selectAttendanceCalendarList(AttendanceCalendarVo attendanceCalendarVo){
        List<AttendanceCalendarVo> attendanceCalendarList = con_attendEventDao.selectAttendanceCalendarList(attendanceCalendarVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, attendanceCalendarList));
    }

    public String selectAttendanceWeekCalendarList(AttendanceCalendarVo attendanceCalendarVo){
        AttendanceCalendarVo weekAttendanceCalendarVo = con_attendEventDao.selectAttendanceWeekCalendarList(attendanceCalendarVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, weekAttendanceCalendarVo));
    }

    public String selectAttendanceBonus(AttendanceBonusVo attendanceBonusVo){
        AttendanceBonusVo resultBonusVo = con_attendEventDao.selectAttendanceBonus(attendanceBonusVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultBonusVo));
    }

    public String selectGiftconList(AttendanceGiftconVo attendanceGiftconVo){
        List<AttendanceGiftconVo> giftconList = con_attendEventDao.selectGiftconList(attendanceGiftconVo);
        int totalCnt = con_attendEventDao.selectGiftconCnt(attendanceGiftconVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, giftconList, new PagingVo(totalCnt)));
    }
}
