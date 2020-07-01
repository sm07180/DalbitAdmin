package com.dalbit.customer.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.customer.dao.Cus_BlockAdmDao;
import com.dalbit.customer.vo.BlockAdmVo;
import com.dalbit.member.vo.MemberVo;
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

    /**
     * IP/Uuid 차단 (Modal)
     */
    public String insertBlock(BlockAdmVo blockAdmVo) {
        blockAdmVo.setOp_name(MemberVo.getMyMemNo());

        blockAdmVo.setEdit_type(0);
        if(blockAdmVo.getBlock_type() == 1) {
            blockAdmVo.setEdit_contents("deviceUuid 차단 등록 : " + blockAdmVo.getBlock_text());
        } else {
            blockAdmVo.setEdit_contents("ip 차단 등록 : " + blockAdmVo.getBlock_text());
        }
        cusBlockAdmDao.insertBlockHistory(blockAdmVo);

        int result = cusBlockAdmDao.insertBlock(blockAdmVo);
        if(result > 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.회원ipUuid차단_성공));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.회원ipUuid차단_실패));
        }
    }

    /**
     * 차단 내역 삭제 (차단 해지)
     */
    public String deleteBlock(BlockAdmVo blockAdmVo) {
        return "";
    }
}
