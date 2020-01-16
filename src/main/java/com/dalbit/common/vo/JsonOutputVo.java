package com.dalbit.common.vo;

import com.dalbit.common.code.Status;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

/**
 * JSON output을 위한 VO
 */
@Getter
@Setter
public class JsonOutputVo {

    public JsonOutputVo(){}

    public JsonOutputVo(Status status){
        setStatus(status);
    }

    public JsonOutputVo(Status status, Object data){
        setStatus(status);
        setData(data);
        setTimestamp(DalbitUtil.getTimeStamp());
    }

    private String result;

    private Status status;

    private String messageCode;
    private String messageKey;
    private String message;

    private Object data;

    private String timestamp;

    public void setStatus(Status status){
        //this.messageCode = status.getMessageCode();
        this.messageKey = status.getMessageKey();
        this.result = status.getResult();
    }

}
