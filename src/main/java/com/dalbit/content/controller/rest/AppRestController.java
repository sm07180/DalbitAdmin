package com.dalbit.content.controller.rest;

import com.dalbit.content.service.AppService;
import com.dalbit.content.vo.AppInsertVo;
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

    /**
     * 앱버전 리스트 상세 조회
     */
    @PostMapping("/detail")
    public String getListDetail(AppVo appVo) {
        String result = appService.getListDetail(appVo);
        return result;
    }

    /**
     * 앱버전 리스트 등록
     */
    @PostMapping("/insert")
    public String addAppVersion(AppInsertVo appInsertVo) {
        String result = appService.addAppVersion(appInsertVo);
        return result;
    }

//    /**
//     * 앱버전 리스트 수정
//     */
//    @PostMapping("/update")
//    public String updateAppVersion(AppVo appVo) {
//        String result = appService.updateAppVersion(appVo);
//        return result;
//    }
//
//    /**
//     * 앱버전 리스트 삭제
//     */
//    @PostMapping("/delete")
//    public String deleteAppVersion(AppVo appVo) {
//        String result = appService.deleteAppVersion(appVo);
//        return result;
//    }
}
