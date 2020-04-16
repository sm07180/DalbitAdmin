package com.dalbit.content.dao;

import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public interface ThemeDao {
    int callContentsThemeDelete(String codeType);
    int callContentsThemeInsert(HashMap codeVoList);

}
