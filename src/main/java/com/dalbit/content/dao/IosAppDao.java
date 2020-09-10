package com.dalbit.content.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Repository
public interface IosAppDao {
    @Transactional(readOnly = true)
    List<HashMap> selectVersion();

    @Transactional(readOnly = true)
    HashMap selectLast();

    @Transactional(readOnly = true)
    List<HashMap> selectApp(String version);

    int insertApp(HashMap params);

    int deleteApp(HashMap params);
}
