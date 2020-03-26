package com.dalbit.security.handler;

import com.dalbit.util.CookieUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
@Component("logoutHandler")
public class LogoutHandlerImpl implements LogoutHandler {

    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication){
        log.info("로그아웃 핸들러");
        try {
            CookieUtil.deleteCookie("JSESSIONID", "", "", 0);
            CookieUtil.deleteCookie("ADMIN_COOKIE", "", "", 0);
            CookieUtil.deleteCookie("gSTAFF", "", "", 0);
            CookieUtil.deleteCookie("NAME", "", "", 0);
            CookieUtil.deleteCookie("USER_ID", "", "", 0);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
