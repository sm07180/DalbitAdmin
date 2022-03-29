package com.dalbit.menu.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.menu.dao.Men_PartnerDao;
import com.dalbit.menu.vo.procedure.*;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Men_PartnerService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Men_PartnerDao menPartnerDao;

    /**
     * 파트너DJ 목록
     *
     * @param pPartnerInputVo
     * @return
     */
    public String list(P_PartnerInputVo pPartnerInputVo) {
        List<Object> getList = menPartnerDao.selectPartners(pPartnerInputVo);
        P_PartnerTotalCntOutputVo total = DBUtil.getData(getList, P_PartnerTotalCntOutputVo.class);
        List<P_PartnerListOutputVo> list = DBUtil.getList(getList, P_PartnerListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", total.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 파트너DJ 등록
     *
     * @param pPartnerBenefitInputVo
     * @return
     */
    public String create(P_PartnerBenefitInputVo pPartnerBenefitInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pPartnerBenefitInputVo.setChrgrName(chrgrName);
        int resultCnt = menPartnerDao.insertPartner(pPartnerBenefitInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.생성));
        resHashMap.put("data", resultCnt);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 파트너DJ 수정
     *
     * @param pPartnerBenefitInputVo
     * @return
     */
    public String modify(P_PartnerBenefitInputVo pPartnerBenefitInputVo) {
        int resultCnt = menPartnerDao.updatePartner(pPartnerBenefitInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.수정));
        resHashMap.put("data", resultCnt);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 파트너DJ 등록 취소
     *
     * @param pPartnerCancelInputVo
     * @return
     */
    public String cancel(P_PartnerCancelInputVo pPartnerCancelInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pPartnerCancelInputVo.setChrgrName(chrgrName);
        int resultCnt = menPartnerDao.deletePartner(pPartnerCancelInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.삭제));
        resHashMap.put("data", resultCnt);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 파트너DJ 검색
     *
     * @param pPartnerInputVo
     * @return
     */
    public String search(P_PartnerInputVo pPartnerInputVo) {
        List<Object> getList = menPartnerDao.selectFindPartners(pPartnerInputVo);
        P_PartnerTotalCntOutputVo total = DBUtil.getData(getList, P_PartnerTotalCntOutputVo.class);
        List<P_PartnerSearchListOutputVo> list = DBUtil.getList(getList, P_PartnerSearchListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", total.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }
}
