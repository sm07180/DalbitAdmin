package com.dalbit.content.service;

import com.dalbit.content.dao.SitebanDao;
import com.dalbit.content.vo.SitebanVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.JwtUtil;
import com.dalbit.util.SocketUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service
public class SitebanService {

    @Autowired
    SitebanDao sitebanDao;

    @Autowired
    SocketUtil socketUtil;

    @Autowired
    JwtUtil jwtUtil;

    public SitebanVo selectBanword(){
        SitebanVo sitebanVo = sitebanDao.selectBanword();

        sitebanVo.getBan_word();
        sitebanVo.getCount();

        return sitebanVo;
    }

    @Transactional(readOnly = false)
    public int updateBanword(SitebanVo sitebanVo){

        int result = sitebanDao.updateBanword(sitebanVo);

        Gson gson = new Gson();
        HashMap<String,Object> message = new HashMap();
        String publicChanel = DalbitUtil.getProperty("socket.global.room");
        message.put("channel", publicChanel);
        message.put("memNo", "");

        HashMap<String,Object> param = new HashMap<>();
        param.put("roomNo", publicChanel);

        Map<String, Object> data =  socketUtil.setSocket(param,"reqBanWord", gson.toJson(message), jwtUtil.generateToken(DalbitUtil.getProperty("temp.memNo"), true));

        return result;
    }
}
