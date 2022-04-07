package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_TeamService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/rest/content/team")
public class Con_TeamRestController {

    @Autowired
    Con_TeamService teamService;


}
