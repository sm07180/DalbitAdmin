package com.dalbit.content.service;

import com.dalbit.common.vo.CodeVo;
import com.dalbit.content.dao.ThemeDao;
import com.dalbit.socket.service.SocketService;
import com.dalbit.util.RestApiUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class ThemeService {

    @Value("${server.api.urls}")
    private String SERVER_API_URLS;

    @Autowired
    ThemeDao themeDao;

    @Autowired
    SocketService socketService;

    /**
     * 주제 수정
     */
    @Transactional(readOnly = false)
    public void callContentsThemeEdit(String codeType, CodeVo[] codeVos) {
        themeDao.callContentsThemeDelete(codeType);

        List<CodeVo> codeVoList = Arrays.asList(codeVos);
        HashMap mapParam = new HashMap();
        mapParam.put("codeType", codeType);
        mapParam.put("codeVoList", codeVoList);
        themeDao.callContentsThemeInsert(mapParam);
    }


    @Async("threadTaskExecutor")
    public void sendSplashApi() {
        HashMap map = new HashMap();
        map.put("null", "-");

        for(String url : SERVER_API_URLS.split("\\,")){
            url += "/splash";
            log.debug("[REQUEST API] URL :{}",url);
            String result = RestApiUtil.sendPost(url, new Gson().toJson(map));
            log.debug("[REQUEST API] RESULT :{}",result);
        }
    }
}
