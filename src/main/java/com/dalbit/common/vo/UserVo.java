package com.dalbit.common.vo;

import com.dalbit.security.vo.SecurityUserVo;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.context.SecurityContextHolder;

@Getter @Setter
public class UserVo extends BaseVo {

    public static UserVo getUserInfo() {
        SecurityUserVo user = (SecurityUserVo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return null;
        //return user.getUserInfo();
    }

    private String id;
    private String password;
    private String name;
    private String birth;
    private String phone;
    private String userToken;
}
