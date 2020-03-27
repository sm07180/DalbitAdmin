package com.dalbit.connect.controller.rest;

import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/connect/user")
public class Con_UserRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;


}
