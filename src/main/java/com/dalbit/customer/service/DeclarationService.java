package com.dalbit.customer.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.code.*;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.dao.DeclarationDao;
import com.dalbit.customer.vo.procedure.P_DeclarationInputListVo;
import com.dalbit.customer.vo.procedure.P_DeclarationOutputListVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class DeclarationService {

    @Autowired
    DeclarationDao declarationDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    /**
     * 신고 목록 조회
     */
    public String callServiceCenterReportList(P_DeclarationInputListVo pDeclarationInputListVo) {
        ProcedureVo procedureVo = new ProcedureVo(pDeclarationInputListVo);

        ArrayList<P_DeclarationOutputListVo> declareList = declarationDao.callServiceCenterReportList(procedureVo);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고목록조회_성공, declareList, new PagingVo(procedureVo.getRet())));
        } else if(Status.신고목록조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고목록조회_데이터없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.신고목록조회_에러));
        }

        return result;
    }

    /**
     * 선택 회원 정보
     * */

}
