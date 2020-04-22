package com.dalbit.administrate.service;

import com.dalbit.administrate.dao.Adm_FaqDao;
import com.dalbit.administrate.dao.Adm_MenuDao;
import com.dalbit.administrate.vo.procedure.*;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Slf4j
@Service
public class Adm_MenuService {

    @Autowired
    Adm_MenuDao adm_MenuDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 메뉴 상세 조회
     */
    public String getMenuInfo(P_MenuInfoInputVo pMenuInfoInputVo) {
        HashMap<P_MenuInfoOutputVo,String> menuInfo = adm_MenuDao.callMenuInfo(pMenuInfoInputVo);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.조회, menuInfo));
        return result;
    }
}
