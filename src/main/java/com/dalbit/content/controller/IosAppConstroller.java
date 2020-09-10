package com.dalbit.content.controller;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.service.IosAppService;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Slf4j
@Controller
@RequestMapping("/content/ios")
public class IosAppConstroller {
    @Autowired
    IosAppService iosAppService;
    @Autowired
    GsonUtil gsonUtil;

    @GetMapping("/list")
    public String list() {
        return "content/ios/list";
    }

    @GetMapping("/version")
    @ResponseBody
    public String version(){
        HashMap result = iosAppService.getVersion();
        return gsonUtil.toJson(new JsonOutputVo((Status) result.get("status"), result.get("data")));
    }

    @GetMapping("/app")
    @ResponseBody
    public String app(HttpServletRequest request){
        HashMap result = iosAppService.getApp(request);
        return gsonUtil.toJson(new JsonOutputVo((Status) result.get("status"), result.get("data")));
    }

    @PostMapping("")
    @ResponseBody
    public String insert(HttpServletRequest request){
        return gsonUtil.toJson(new JsonOutputVo(iosAppService.doInsert(request)));
    }

    @DeleteMapping("")
    @ResponseBody
    public String delete(HttpServletRequest request){
        return gsonUtil.toJson(new JsonOutputVo(iosAppService.doDelete(request)));
    }
}
