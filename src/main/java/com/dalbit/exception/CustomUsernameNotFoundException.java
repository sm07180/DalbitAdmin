package com.dalbit.exception;

import com.dalbit.common.code.Status;
import com.dalbit.util.MessageUtil;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Setter
@Getter
public class CustomUsernameNotFoundException extends UsernameNotFoundException {

    @Autowired
    MessageUtil messageUtil;

    private Status status;

    public CustomUsernameNotFoundException(String msg) {
        super(msg);
    }

    public CustomUsernameNotFoundException(Status status) {
        super(status.getMessageCode());
        setStatus(status);
    }

    public CustomUsernameNotFoundException(String msg, Throwable t) {
        super(msg, t);
    }
}
