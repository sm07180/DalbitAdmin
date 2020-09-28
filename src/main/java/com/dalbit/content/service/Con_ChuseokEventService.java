package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.dao.Con_ChuseokEventDao;
import com.dalbit.content.vo.ChuseokEventVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class Con_ChuseokEventService {

    @Autowired
    Con_ChuseokEventDao con_chuseokEventDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 출석 이벤트 리스트 조회
     */
    public String selectFreeDalList(ChuseokEventVo chuseokEventVo) {

        int totalCnt = con_chuseokEventDao.selectFreeDalListCnt(chuseokEventVo);
        chuseokEventVo.setTotalCnt(totalCnt);

        List<ChuseokEventVo> list = con_chuseokEventDao.selectFreeDalList(chuseokEventVo);
        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(chuseokEventVo.getTotalCnt(), chuseokEventVo.getPageStart(), chuseokEventVo.getPageCnt())));

        return result;
    }
}
