package com.dalbit.common.service;

import com.dalbit.common.dao.CommonDao;
import com.dalbit.common.vo.CodeVo;
import com.dalbit.common.vo.ItemVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class CommonService {

    @Autowired
    CommonDao commonDao;

    @Cacheable(cacheNames = "codeCache", key = "#code")
    public HashMap getCodeCache(String code) {
        HashMap resultMap = callCodeDefineSelect();

        List<ItemVo> items = new ArrayList<>();
        items.add(new ItemVo("1001", "곰토끼", 10, "https://6.viki.io/image/a11230e2d98d4a73825a4c10c8c6feb0.jpg", "https://image.dalbitcast.com/ani/webp/2020.02.07_1.webp", "https://devimage.dalbitcast.com/ani/webp/2020.02.07_1.json"));
        items.add(new ItemVo("1002", "곰인형", 20, "https://t1.daumcdn.net/cfile/tistory/99DC6A385CC11E5A26", "https://image.dalbitcast.com/ani/webp/2020.02.07_2.webp", "https://devimage.dalbitcast.com/ani/webp/2020.02.07_2.json"));
        items.add(new ItemVo("1003", "도너츠달", 30, "https://t1.daumcdn.net/cfile/tistory/99A2AC3E5D15A5F629", "https://image.dalbitcast.com/ani/webp/2020.02.07_3.webp", "https://devimage.dalbitcast.com/ani/webp/2020.02.07_3.json"));
        items.add(new ItemVo("1004", "도너츠", 40, "http://image.cine21.com/resize/cine21/person/2019/0729/11_42_45__5d3e5d25ef4fb[H800-].jpg", "https://image.dalbitcast.com/ani/webp/2020.02.07_4.webp", "https://devimage.dalbitcast.com/ani/webp/2020.02.07_4.json"));
        resultMap.put("items", items);
        return resultMap;
    }

    @CachePut(cacheNames = "codeCache", key = "#code")
    public HashMap updateCodeCache(String code) {
        return callCodeDefineSelect();
    }

    public HashMap callCodeDefineSelect(){
        List<Map> data = commonDao.callCodeDefineSelect();

        HashMap<String, Object> result = new HashMap<>();
        result.put("memGubun", setData(data, "mem_slct"));
        result.put("osGubun", setData(data, "os_type"));
        result.put("roomType", setData(data, "subject_type"));
        result.put("roomState", setData(data, "broadcast_state"));
        result.put("roomRight", setData(data, "broadcast_auth"));
        result.put("declarReason", setData(data, "report_reason"));

        return result;
    }

    public List<CodeVo> setData(List<Map> list, String type) {
        List<CodeVo> data = new ArrayList<>();
        if(list != null && list.size() > 0){
            for(int i = 0; i < list.size(); i++){
                if(type.equals((String)list.get(i).get("type"))){
                    data.add(new CodeVo((String)list.get(i).get("value"), (String)list.get(i).get("code"), i));
                }
            }
        }
        return data;
    }

    public List<CodeVo> getCodeList(String code){
        return (List<CodeVo>)callCodeDefineSelect().get(code);
    }

}
