package com.dalbit.util;

import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**********************************************************************************************
 * @FileName  : DBUtil.java
 * @Date      : 2018. 5. 9.
 * @작성자      : 김채윤
 * @설명       : 
 **********************************************************************************************/
@Slf4j
public class DBUtil {

    public static <T> T getData(List<Object> list, Class<T> obj) {

        for(Object data : list) {
            if( data.getClass().isAssignableFrom(ArrayList.class) ) {
                List<Object> _list = (ArrayList)data;

                if( _list.size() > 0 && !obj.isAssignableFrom( Collections.class) && _list.get(0) != null && obj.isAssignableFrom( _list.get(0).getClass() ) ){
                    return (T)_list.get(0);
                }
            }
        }
        try {
            return obj.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <T> T getData(List<Object> list, Class<T> obj, Boolean nullable) {

        for(Object data : list) {
            if( data.getClass().isAssignableFrom(ArrayList.class) ) {
                List<Object> _list = (ArrayList)data;

                if( _list.size() > 0 && !obj.isAssignableFrom( Collections.class) && _list.get(0) != null && obj.isAssignableFrom( _list.get(0).getClass() ) ){
                    return (T)_list.get(0);
                }
            }
        }

        if( nullable )  return null;

        try {
            return obj.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <T> List<T> getList(List<Object> list, Class<T> obj) {
        if(list != null){
            for(Object data : list) {
                try{
                    if( data.getClass().isAssignableFrom(ArrayList.class) ) {
                        List<Object> _list = (ArrayList)data;
                        if( _list.size() > 0 && _list.get(0) != null && obj.isAssignableFrom( _list.get(0).getClass() ) ){
                            return (List<T>)_list;
                        }
                    }
                }catch (Exception ex){
                    log.debug(ex.getMessage());
                }
            }
        }

        return new ArrayList<>();
    }

    public static <T> List<T> getList(List<Object> list, Class<T> obj, Integer idx) {

        for(int i = 0; i < list.size() ; i++) {
            Object data = list.get(i);
            if( data.getClass().isAssignableFrom(ArrayList.class) ) {
                List<Object> _list = (ArrayList)data;
                if( _list.size() > 0 && _list.get(0) != null && obj.isAssignableFrom( _list.get(0).getClass() ) ) {
                    if( idx == i )
                        return (List<T>)_list;
                }
            }
        }

        return new ArrayList<>();
    }

}
