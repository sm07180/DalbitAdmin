package com.dalbit.clip.controller.rest;

import com.dalbit.clip.service.Cli_ClipCategoryService;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.CodeVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.service.ThemeService;
import com.dalbit.content.vo.ThemeVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/clip/category")
public class Cli_ClipCategoryRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Cli_ClipCategoryService cliClipCategoryService;
    @Autowired
    CommonService commonService;
    @Autowired
    ThemeService themeService;

    @PostMapping("clip/list")
    public String clipCodeList(HttpServletRequest request, ThemeVo splashVo) {
        List<CodeVo> roomTypeList = commonService.getCodeList("clipType");

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, roomTypeList));
    }

    @PostMapping("clip/submit")
    public String clipCodeUpdate(HttpServletRequest request) {
        String codeType = request.getParameter("codeType");
        String codeVoArr = request.getParameter("codeVoArr");

        CodeVo[] codeVos = new Gson().fromJson(codeVoArr, CodeVo[].class);

        themeService.callContentsThemeEdit(codeType, codeVos);
        //API splash Reload
        themeService.sendSplashApi();

        return gsonUtil.toJson(new JsonOutputVo(Status.수정));
    }

}
