package com.dalbit.main.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.InforexMenu;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@RestController
@RequestMapping("rest/main")
public class MainRestController {

    @Autowired
    GsonUtil gsonUtil;


    /**
     * 회원리스트
     * //@param model
     * @return
     */
    @PostMapping("inforex/menu")
    public String inforexMenu(HttpServletRequest request, HttpSession session){

        log.info("메뉴");

        String json = request.getParameter("data");
        InforexMenu[] InforexMenuInfo =  new Gson().fromJson(json, InforexMenu[].class);
        session.setAttribute("InforexMenuInfo", InforexMenuInfo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회));
    }



}
