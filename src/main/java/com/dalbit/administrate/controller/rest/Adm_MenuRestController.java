package com.dalbit.administrate.controller.rest;

import com.dalbit.administrate.dao.Adm_MenuDao;
import com.dalbit.administrate.service.Adm_MenuService;
import com.dalbit.administrate.vo.procedure.P_MenuInfoInputVo;
import com.dalbit.administrate.vo.procedure.P_MenuListOutputVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@Slf4j
@RestController
@RequestMapping("/rest/administrate/menu")
public class Adm_MenuRestController {

    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    CommonService commonService;
    @Autowired
    Adm_MenuDao adm_MenuDao;
    @Autowired
    Adm_MenuService adm_MenuService;


    @PostMapping("list")
    public String list() {
        ArrayList<P_MenuListOutputVo> menuList = adm_MenuDao.callMenuList();

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.조회, menuList));
        return result;
    }

    @PostMapping("menuInfo")
    public String menuInfo(P_MenuInfoInputVo pMenuInfoInputVo) {
        String result = adm_MenuService.getMenuInfo(pMenuInfoInputVo);
        return result;
    }

}
