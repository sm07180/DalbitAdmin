package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.Con_EmoticonDao;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Con_EmoticonService {

    @Autowired
    Con_EmoticonDao emoticonDao;

    @Autowired
    GsonUtil gsonUtil;

    @Value("${admin.memNo}")
    String ADMIN_MEM_NO;



    /** 인싸티콘 카테고리 리스트 */
    public String callAdminEmoticonCategorySelect(P_EmoticonCategoryListInputVo pEmoticonCategoryListInputVo) {
        pEmoticonCategoryListInputVo.setMem_no(ADMIN_MEM_NO);
        ProcedureVo procedureVo = new ProcedureVo(pEmoticonCategoryListInputVo);
        String result = "";

        try {
            ArrayList<P_EmoticonCategoryListOutputVo> emoticonCategoryList = emoticonDao.callAdminEmoticonCategorySelect(procedureVo);
            int selectResult = Integer.parseInt(procedureVo.getRet());

            if(selectResult > 0) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.조회, emoticonCategoryList, new PagingVo(selectResult)));
            }else if(selectResult == -1){
                result = gsonUtil.toJson(new JsonOutputVo(Status.권한없음));
            }else {
                result = gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }

        return result;
    }

    public String callAdminEmoticonCategoryEdit(P_EmoticonCategoryUpdateVo pEmoticonCategoryUpdateVo) {
        ProcedureVo procedureVo = new ProcedureVo(pEmoticonCategoryUpdateVo);
        procedureVo.setData(pEmoticonCategoryUpdateVo.getEditData());
        String result = "";

        try {
            emoticonDao.callAdminEmoticonCategoryEdit(procedureVo);

            int insertResult = Integer.parseInt(procedureVo.getRet());

            if(insertResult == 0) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.수정));
            }else if(insertResult == -1){
                result = gsonUtil.toJson(new JsonOutputVo(Status.삭제));
            }else if(insertResult == -2){
                result = gsonUtil.toJson(new JsonOutputVo(Status.파라미터오류));
            }else {
                result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }

        return result;
    }


    /** 인싸티콘 리스트 */
    public String callAdminEmoticonSelect(P_EmoticonListInputVo pEmoticonListInputVo) {
        pEmoticonListInputVo.setMem_no(ADMIN_MEM_NO);
        ProcedureVo procedureVo = new ProcedureVo(pEmoticonListInputVo);
        String result = "";

        try {
            ArrayList<P_EmoticonListOutputVo> list = emoticonDao.callAdminEmoticonSelect(procedureVo);
            int selectResult = Integer.parseInt(procedureVo.getRet());

            // 수정을 위한 전체 목록 조회
            P_EmoticonListInputVo allData = new P_EmoticonListInputVo();
            allData.setMem_no(ADMIN_MEM_NO);
            allData.setCategoryNo(-1);
            allData.setViewOn(-1);
            ProcedureVo procedureVo1 = new ProcedureVo(allData);
            ArrayList<P_EmoticonListOutputVo> summary = emoticonDao.callAdminEmoticonSelect(procedureVo1);

            if(selectResult > 0 ) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(selectResult), summary));
            }else if(selectResult == -1){
                result = gsonUtil.toJson(new JsonOutputVo(Status.권한없음));
            }else {
                result = gsonUtil.toJson(new JsonOutputVo(Status.데이터없음, list, new PagingVo(selectResult), summary));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }

        return result;
    }

    /**
     * 인싸티콘 등록
     */
    public String callAdminEmoticonAdd(P_EmoticonInsertVo pEmoticonInsertVo){
        ProcedureVo procedureVo = new ProcedureVo(pEmoticonInsertVo);
        String result = "";

        try{
            emoticonDao.callAdminEmoticonAdd(procedureVo);
            int insertResult = Integer.parseInt(procedureVo.getRet());

            if(insertResult == 0){
                result = gsonUtil.toJson(new JsonOutputVo(Status.생성));
            }else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.파라미터오류));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }

        return result;
    }

    /**
     * 인싸티콘 수정
     */
    public String callAdminEmoticonEdit(P_EmoticonUpdateVo pEmoticonUpdateVo) {
           ProcedureVo procedureVo = new ProcedureVo(pEmoticonUpdateVo);
        procedureVo.setData(pEmoticonUpdateVo.getEditData());
        String result = "";

        try{
            ArrayList<P_EmoticonListOutputVo> list = emoticonDao.callAdminEmoticonEdit(procedureVo);
            int updateResult = Integer.parseInt(procedureVo.getRet());

            if(updateResult == 0 || updateResult == -1){
                 result = gsonUtil.toJson(new JsonOutputVo(Status.수정));
            }else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }

        return result;
    }

}
