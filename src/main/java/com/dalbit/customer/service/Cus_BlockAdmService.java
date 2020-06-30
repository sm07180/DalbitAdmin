package com.dalbit.customer.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.customer.dao.Cus_BlockAdmDao;
import com.dalbit.customer.vo.BlockAdmVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dalbit.common.code.Status;

import java.util.ArrayList;

@Slf4j
@Service
public class Cus_BlockAdmService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Cus_BlockAdmDao cusBlockAdmDao;

    /**
     * 차단 회원 내역 조회
     */
    public String selectBlockList(BlockAdmVo blockAdmVo) {
        int count = cusBlockAdmDao.selectBlockListCnt(blockAdmVo);
        ArrayList<BlockAdmVo> list = cusBlockAdmDao.selectBlockList(blockAdmVo);
        blockAdmVo.setTotalCnt(count);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(blockAdmVo.getTotalCnt(), blockAdmVo.getPageStart(), blockAdmVo.getPageCnt())));
    }

    /**
     * 차단 내역 메시지 상세보기
     */
    public String selectBlockDetail(BlockAdmVo blockAdmVo) {
        BlockAdmVo blockDetail = cusBlockAdmDao.selectBlockDetail(blockAdmVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, blockDetail));
    }
}
