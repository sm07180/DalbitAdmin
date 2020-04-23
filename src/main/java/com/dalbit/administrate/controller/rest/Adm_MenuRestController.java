package com.dalbit.administrate.controller.rest;

import com.dalbit.administrate.dao.Adm_MenuDao;
import com.dalbit.administrate.service.Adm_MenuService;
import com.dalbit.administrate.vo.procedure.P_MenuInfoInputVo;
import com.dalbit.administrate.vo.procedure.P_MenuInfoUpdateInputVo;
import com.dalbit.administrate.vo.procedure.P_MenuListOutputVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.MenuVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
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

    @PostMapping("menuUpdate")
    public String menuUpdate(HttpServletRequest request) {
        String menuList = request.getParameter("menuList");

        MenuVo[] menuVos = new Gson().fromJson(menuList, MenuVo[].class);
        String result = adm_MenuService.getMenuUpdate(menuVos);
        return result;
    }

    @PostMapping("menuInfoUpdate")
    public String menuInfoUpdate(P_MenuInfoUpdateInputVo pMenuInfoUpdateInputVo) {
        String result = adm_MenuService.getMenuInfoUpdate(pMenuInfoUpdateInputVo);
        return result;
    }
}
