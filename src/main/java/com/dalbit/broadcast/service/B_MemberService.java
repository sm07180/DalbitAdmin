package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.B_MemberDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class B_MemberService {

    @Autowired
    B_MemberDao bMemberDao;


}
