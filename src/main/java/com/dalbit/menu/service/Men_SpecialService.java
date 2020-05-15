package com.dalbit.menu.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.menu.dao.Men_SpecialDao;
import com.dalbit.menu.vo.SpecialReqVo;
import com.dalbit.menu.vo.SpecialVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dalbit.common.code.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
public class Men_SpecialService {

    @Autowired
    Men_SpecialDao menSpecialDao;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 스페셜 달D 신청 목록 조회
     */
    public String getReqSpecialList(SpecialReqVo specialReqVo) {
        specialReqVo.setOp_name(MemberVo.getMyMemNo());
        List<SpecialReqVo> list = menSpecialDao.getReqSpecialList(specialReqVo);
        int getReqSpecialListCnt = menSpecialDao.getReqSpecialListCnt(specialReqVo);
        specialReqVo.setTotalCnt(getReqSpecialListCnt);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(specialReqVo.getTotalCnt(), specialReqVo.getPageStart(), specialReqVo.getPageCnt())));

        return result;
    }

    /**
     * 스페셜 달D 신청 상세 목록 조회
     */
    public String getReqSpecialDetail(SpecialReqVo specialReqVo) {
        SpecialReqVo detail = menSpecialDao.getReqSpecialDetail(specialReqVo);
        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, detail));
        return result;
    }

    /**
     * 스페셜 달D 신청 승인
     */
    @Transactional(readOnly = false)
    public String reqOk(SpecialReqVo specialReqVo) {
        specialReqVo.setOp_name(MemberVo.getMyMemNo());
        int result = menSpecialDao.reqOk(specialReqVo);

        specialReqVo.setState(2);
        menSpecialDao.reqOkUpdate(specialReqVo);

        specialReqVo.setSpecialdj_badge(1);
        menSpecialDao.profileUpdate(specialReqVo);

        if(result > 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.수정));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.파라미터오류));
        }
    }

    /**
     * 스페셜 달D 목록 조회
     */
    public String getSpecialList(SpecialVo specialVo) {
        specialVo.setOp_name(MemberVo.getMyMemNo());
        List<SpecialVo> list = menSpecialDao.getSpecialList(specialVo);
        int getSpecialListCnt = menSpecialDao.getSpecialListCnt(specialVo);
        specialVo.setTotalCnt(getSpecialListCnt);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(specialVo.getTotalCnt(), specialVo.getPageStart(), specialVo.getPageCnt())));

        return result;
    }
}
