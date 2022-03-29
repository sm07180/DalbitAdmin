package com.dalbit.menu.dao;

import com.dalbit.menu.vo.procedure.P_PartnerBenefitInputVo;
import com.dalbit.menu.vo.procedure.P_PartnerCancelInputVo;
import com.dalbit.menu.vo.procedure.P_PartnerInputVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Men_PartnerDao {
    /**
     * 파트너DJ 목록
     *
     * @param pPartnerInputVo
     * @return
     */
    List<Object> selectPartners(P_PartnerInputVo pPartnerInputVo);

    /**
     * 파트너DJ 등록
     *
     * @param pPartnerBenefitInputVo
     * @return
     */
    int insertPartner(P_PartnerBenefitInputVo pPartnerBenefitInputVo);

    /**
     * 파트너DJ 수정
     *
     * @param pPartnerBenefitInputVo
     * @return
     */
    int updatePartner(P_PartnerBenefitInputVo pPartnerBenefitInputVo);

    /**
     * 파트너DJ 취소
     *
     * @param pPartnerCancelInputVo
     * @return
     */
    int deletePartner(P_PartnerCancelInputVo pPartnerCancelInputVo);

    /**
     * 파트너DJ 검색
     *
     * @param pPartnerInputVo
     * @return
     */
    List<Object> selectFindPartners(P_PartnerInputVo pPartnerInputVo);
}
