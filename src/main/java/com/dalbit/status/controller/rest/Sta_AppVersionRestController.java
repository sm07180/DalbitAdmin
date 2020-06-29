package com.dalbit.status.controller.rest;

import com.dalbit.status.service.Sta_AppVersionService;
import com.dalbit.status.vo.procedure.P_AppVersionVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/status/appVersion")
public class Sta_AppVersionRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    Sta_AppVersionService sta_appVersionService;

//    /**
//     * 앱 버전 별 사용자 수
//     */
//    @PostMapping("selectVersionUser")
//    public String selectVersionUser(P_AppVersionVo pAppVersionVo){
//        return sta_appVersionService.selectVersionUser(pAppVersionVo);
//    }

    /**
     * 빌드번호 별 사용자 수
     */
    @PostMapping("selectBuildUser")
    public String selectBuildUser(P_AppVersionVo pAppVersionVo) {
        return sta_appVersionService.selectBuildUser(pAppVersionVo);
    }


    /**
     * 현재 마켓 노출 버전
     */
    @PostMapping("selectMarketVersion")
    public String selectMarketVersion(P_AppVersionVo pAppVersionVo){
        return sta_appVersionService.selectMarketVersion(pAppVersionVo);
    }

    /**
     * 총 리스트 조회
     */
    @PostMapping("selectTotalList")
    public String selectTotalList(P_AppVersionVo pAppVersionVo){
        return sta_appVersionService.selectTotalList(pAppVersionVo);
    }
}
