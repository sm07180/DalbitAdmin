package com.dalbit.customer.service;

import com.dalbit.customer.dao.QuestionDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class QuestionService {

    @Autowired
    QuestionDao questionDao;
}
