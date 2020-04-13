package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.CodeVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.service.SitebanService;
import com.dalbit.content.service.ThemeService;
import com.dalbit.content.vo.SitebanVo;
import com.dalbit.content.vo.ThemeVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/content/siteban")
public class SitebanRestController {

    @Autowired
    SitebanService sitebanService;

    @Autowired
    CommonService commonService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("list")
    public String list(HttpServletRequest request, ThemeVo splashVo) {
        SitebanVo sitebanVo = sitebanService.selectBanword();

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, sitebanVo));
    }

    @PostMapping("update")
    public String update(HttpServletRequest request, ThemeVo splashVo) {
        SitebanVo sitebanVo = sitebanService.selectBanword();

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, sitebanVo));
    }
}
