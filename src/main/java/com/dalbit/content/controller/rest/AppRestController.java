package com.dalbit.content.controller.rest;

import com.dalbit.content.service.AppService;
import com.dalbit.content.vo.AppVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/rest/content/app")
public class AppRestController {

    @Autowired
    AppService appService;

    /**
     * 앱버전 리스트 조회
     */
    @PostMapping("/list")
    public String getAppVersionList(AppVo appVo) {
        String result = appService.getAppVersionList(appVo);
        return result;
    }
}
