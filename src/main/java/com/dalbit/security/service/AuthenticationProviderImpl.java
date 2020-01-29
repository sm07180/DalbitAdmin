package com.dalbit.security.service;

import com.dalbit.security.vo.SecurityUserVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

@Slf4j
@Component("authProvider")
public class AuthenticationProviderImpl implements AuthenticationProvider {

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        //String userName = authentication.getName();
        //String password = (String)authentication.getCredentials();

        SecurityUserVo securityUserVo = (SecurityUserVo)userDetailsService.loadUserByUsername("");

        return new UsernamePasswordAuthenticationToken(
                securityUserVo.getUsername()
                , securityUserVo.getPassword()
                , securityUserVo.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}
