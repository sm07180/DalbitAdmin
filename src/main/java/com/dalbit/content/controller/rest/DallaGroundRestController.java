package com.dalbit.content.controller.rest;

import com.dalbit.content.service.DallaGroundService;
import com.dalbit.content.vo.GroundListVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/content/event/ground")
public class DallaGroundRestController {
    @Autowired DallaGroundService dallaGroundService;

    @GetMapping("/page")
    public String dallaGroundPage() {
        return dallaGroundService.dallaGroundPage();
    }
}
