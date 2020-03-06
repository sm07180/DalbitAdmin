package com.dalbit.content.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.NoticeDao;
import com.dalbit.content.vo.procedure.P_noticeInsertVo;
import com.dalbit.content.vo.procedure.P_noticeListInputVo;
import com.dalbit.common.code.*;
import com.dalbit.content.vo.procedure.P_noticeListOutputVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class NoticeService {

    @Autowired
    NoticeDao noticeDao;

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;


    /**
     * 사이트 공지 조회
     */
    public String callServiceCenterNoticeList(P_noticeListInputVo pNoticeListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pNoticeListInputVo);

        ArrayList<P_noticeListOutputVo> noticeList = noticeDao.callServiceCenterNoticeList(procedureVo);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.조회, noticeList));
        }else if(Status.공지사항조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지사항조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지사항조회_에러));
        }

        return result;
    }

    /**
     * 사이트 공지 등록
     */
    public String callServiceCenterNoticeAdd(P_noticeInsertVo pNoticeInsertVo){
        ProcedureVo procedureVo = new ProcedureVo(pNoticeInsertVo);

        noticeDao.callServiceCenterNoticeAdd(procedureVo);

        String result;
        if(Status.공지등록성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지등록성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.공지등록실패));
        }

        return result;
    }



}
