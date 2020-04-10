package com.dalbit.common.service;

import com.dalbit.common.annotation.NoLogging;
import com.dalbit.common.dao.CommonDao;
import com.dalbit.common.vo.CodeVo;
import com.dalbit.common.vo.ItemVo;
import com.dalbit.common.vo.MenuVo;
import com.dalbit.util.DalbitUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

@Slf4j
@Service
public class CommonService {

    @Autowired
    CommonDao commonDao;

    @Cacheable(cacheNames = "codeCache", key = "#code")
    public HashMap getCodeCache(String code) {
        HashMap resultMap = callCodeDefineSelect();

        List<ItemVo> items = new ArrayList<>();
        items.add(new ItemVo("1001", "곰토끼", 10, "https://6.viki.io/image/a11230e2d98d4a73825a4c10c8c6feb0.jpg", "https://image.dalbitlive.com/ani/webp/2020.02.07_1.webp", "https://image.dalbitlive.com/ani/webp/2020.02.07_1.json"));
        items.add(new ItemVo("1002", "곰인형", 20, "https://t1.daumcdn.net/cfile/tistory/99DC6A385CC11E5A26", "https://image.dalbitlive.com/ani/webp/2020.02.07_2.webp", "https://image.dalbitlive.com/ani/webp/2020.02.07_2.json"));
        items.add(new ItemVo("1003", "도너츠달", 30, "https://t1.daumcdn.net/cfile/tistory/99A2AC3E5D15A5F629", "https://image.dalbitlive.com/ani/webp/2020.02.07_3.webp", "https://image.dalbitlive.com/ani/webp/2020.02.07_3.json"));
        items.add(new ItemVo("1004", "도너츠", 40, "http://image.cine21.com/resize/cine21/person/2019/0729/11_42_45__5d3e5d25ef4fb[H800-].jpg", "https://image.dalbitlive.com/ani/webp/2020.02.07_4.webp", "https://image.dalbitlive.com/ani/webp/2020.02.07_4.json"));
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

    @NoLogging
    public String checkHealthy(HttpServletRequest request) {
        String rootDir = request.getSession().getServletContext().getRealPath("/");
        String instance;
        String result = "OK";
        if(rootDir.endsWith("/") || rootDir.endsWith("\\")){
            rootDir = rootDir.substring(0, rootDir.length() - 1);
        }
        instance = rootDir.substring(rootDir.length() - 1);

        if(!Pattern.matches("\\d", instance)){
            instance = "1";
        }

        FileReader fileReader = null;
        try{
            File healthyFile = new File(DalbitUtil.getProperty("server.healthy.check.dir"), "service" + instance + "_" + DalbitUtil.getProperty("server.healthy.check.postfix") + ".txt");
            if(healthyFile.exists()){
                fileReader = new FileReader(healthyFile);
                int cur = 0;
                result = "";
                while((cur = fileReader.read()) != -1){
                    result += (char)cur;
                }
            }
        }catch (FileNotFoundException e) {
            result = "OK";
        }catch (IOException e1) {
            result = "OK";
        }finally {
            if(fileReader != null){
                try {
                    fileReader.close();
                }catch(IOException e){}
            }
        }

        return result;
    }

    public List<MenuVo> getMenuInfo(MenuVo menuVo){
        return commonDao.getMenuInfo(menuVo);
    }

}
