package com.dalbit.security.service;

import com.dalbit.exception.CustomUsernameNotFoundException;
import com.dalbit.exception.GlobalException;
import com.dalbit.security.vo.InforexLoginLayoutVo;
import com.dalbit.security.vo.SecurityUserVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.OkHttpClientUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import okhttp3.FormBody;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

@Slf4j
@Component("authProvider")
public class AuthenticationProviderImpl implements AuthenticationProvider {

    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private InforexAdminLoginService inforexAdminLoginService;

    @Autowired
    HttpServletRequest request;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        //String userName = authentication.getName();
        //String password = (String)authentication.getCredentials();

        InforexLoginLayoutVo inforexLoginLayoutVo = inforexAdminLoginService.login();

        Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

        return new UsernamePasswordAuthenticationToken(
            inforexLoginLayoutVo
            , inforexLoginLayoutVo.getUserInfo().getUserid()
            , authorities);

    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}
