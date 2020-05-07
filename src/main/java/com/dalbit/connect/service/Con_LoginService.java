package com.dalbit.connect.service;


import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.common.vo.StatVo;
import com.dalbit.connect.dao.Con_LoginDao;
import com.dalbit.connect.vo.procedure.*;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
@Service
public class Con_LoginService {

    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Con_LoginDao con_LoginDao;


    /**
     * 로그인 총계
     */

    public String callLoginLive(){
        ProcedureVo procedureVo = new ProcedureVo();
        con_LoginDao.callLoginLive(procedureVo);
        P_LoginLiveOutVo loginLive = new Gson().fromJson(procedureVo.getExt(), P_LoginLiveOutVo.class);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, loginLive));
    }


    /**
     * 로그인 총계
     * @param statVo
     * @return
     */
    public String callLoginTotal(StatVo statVo){

        ProcedureVo procedureVo = new ProcedureVo(statVo);
        List<P_LoginTotalOutDetailVo> detailList =  con_LoginDao.callLoginTotal(procedureVo);
        P_LoginTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginTotalOutVo.class);

        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy.MM.dd");

        String EndDate = statVo.getEndDate();
        String StartDate = statVo.getStartDate();

        Date bEdate = new Date ();
        Date bSdate = new Date ();
        try {
            Date eEDate = transFormat.parse(EndDate);
            Date bSDate = transFormat.parse(StartDate);
            Calendar eCal = Calendar.getInstance();
            Calendar sCal = Calendar.getInstance();
            if(statVo.getSlctType() == 0) {
                bEdate.setTime(eEDate.getTime() - (long) 1000 * 60 * 60 * 24);
                eCal.setTime(bEdate);
                EndDate = String.valueOf(eCal.get(Calendar.YEAR)) + "." + DalbitUtil.lpad(String.valueOf(eCal.get(Calendar.MONTH) + 1),2,"0") + "." + DalbitUtil.lpad(String.valueOf(eCal.get(Calendar.DATE)),2,"0");
                StartDate = EndDate;
            }else if(statVo.getSlctType() == 1) {
                bEdate.setTime(eEDate.getTime());
                eCal.setTime(bEdate);
                EndDate = String.valueOf(eCal.get(Calendar.YEAR)) + "." + DalbitUtil.lpad(String.valueOf(eCal.get(Calendar.MONTH)),2,"0") + "." + DalbitUtil.lpad(String.valueOf(eCal.get(Calendar.DATE)),2,"0");

                bSdate.setTime(bSDate.getTime());
                sCal.setTime(bSdate);
                StartDate = String.valueOf(sCal.get(Calendar.YEAR)) + "." + DalbitUtil.lpad(String.valueOf(sCal.get(Calendar.MONTH)),2,"0") + "." + DalbitUtil.lpad(String.valueOf(sCal.get(Calendar.DATE)),2,"0");
            }else if(statVo.getSlctType() == 2) {
                bEdate.setTime(eEDate.getTime());
                eCal.setTime(bEdate);
                eCal.add(eCal.YEAR,-1);
                EndDate = String.valueOf(eCal.get(Calendar.YEAR)) + "." + DalbitUtil.lpad(String.valueOf(eCal.get(Calendar.MONTH) + 1),2,"0") + "." + DalbitUtil.lpad(String.valueOf(eCal.get(Calendar.DATE)),2,"0");

                bSdate.setTime(bSDate.getTime());
                sCal.setTime(bSdate);
                sCal.add(sCal.YEAR,-1);
                StartDate = String.valueOf(sCal.get(Calendar.YEAR)) + "." + DalbitUtil.lpad(String.valueOf(sCal.get(Calendar.MONTH) + 1),2,"0") + "." + DalbitUtil.lpad(String.valueOf(sCal.get(Calendar.DATE)),2,"0");
            }
        }catch (ParseException e){
            e.printStackTrace();
        }

        statVo.setEndDate(EndDate);
        statVo.setStartDate(StartDate);
        procedureVo = new ProcedureVo(statVo);
        List<P_LoginTotalOutDetailVo> bDetailList =  con_LoginDao.callLoginTotal(procedureVo);
        P_LoginTotalOutVo bTotalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginTotalOutVo.class);


        log.info(procedureVo.getExt());

        P_LoginTotalOutVo sumOutVo = new P_LoginTotalOutVo();
        if(totalInfo.getSum_totalCnt() > 0) {
            sumOutVo.setSum_totalCnt(totalInfo.getSum_totalCnt());
            sumOutVo.setSum_maleCnt(totalInfo.getSum_maleCnt());
            sumOutVo.setSum_femaleCnt(totalInfo.getSum_femaleCnt());
            sumOutVo.setSum_noneCnt(totalInfo.getSum_noneCnt());
            sumOutVo.setSum_bTotalCnt(bTotalInfo.getSum_totalCnt());
            sumOutVo.setSum_bMaleCnt(bTotalInfo.getSum_maleCnt());
            sumOutVo.setSum_bFemaleCnt(bTotalInfo.getSum_femaleCnt());
            sumOutVo.setSum_bNoneCnt(bTotalInfo.getSum_noneCnt());
        }else{
            sumOutVo.setSum_totalCnt(0);
            sumOutVo.setSum_maleCnt(0);
            sumOutVo.setSum_femaleCnt(0);
            sumOutVo.setSum_noneCnt(0);
            sumOutVo.setSum_bTotalCnt(0);
            sumOutVo.setSum_bMaleCnt(0);
            sumOutVo.setSum_bFemaleCnt(0);
            sumOutVo.setSum_bNoneCnt(0);
        }

        List list = new ArrayList();
        for (int i=0; i < detailList.size(); i++){
            P_LoginTotalOutDetailVo outVo = new P_LoginTotalOutDetailVo();
            outVo.setDate(detailList.get(i).getDate());
            outVo.setHour(detailList.get(i).getHour());
            outVo.setYear(detailList.get(i).getYear());
            outVo.setMonth(detailList.get(i).getMonth());
            outVo.setDay(detailList.get(i).getDay());
            outVo.setTotalCnt(detailList.get(i).getTotalCnt());
            outVo.setMaleCnt(detailList.get(i).getMaleCnt());
            outVo.setFemaleCnt(detailList.get(i).getFemaleCnt());
            outVo.setNoneCnt(detailList.get(i).getNoneCnt());

            if(i < bDetailList.size()){
                outVo.setBTotalCnt(bDetailList.get(i).getTotalCnt());
                outVo.setBMaleCnt(bDetailList.get(i).getMaleCnt());
                outVo.setBFemaleCnt(bDetailList.get(i).getFemaleCnt());
                outVo.setBNoneCnt(bDetailList.get(i).getNoneCnt());
            }else{
                outVo.setBTotalCnt(0);
                outVo.setBMaleCnt(0);
                outVo.setBFemaleCnt(0);
                outVo.setBNoneCnt(0);
            }
            list.add(outVo);
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", sumOutVo);
        result.put("detailList", list);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 로그인 연령대별
     * @param statVo
     * @return
     */
    public String callLoginAge(StatVo statVo){
        ProcedureVo procedureVo = new ProcedureVo(statVo);
        List<P_LoginAgeOutDetailVo> detailList =  con_LoginDao.callLoginAge(procedureVo);
        P_LoginAgeOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginAgeOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }
    /**
     * 로그인 브라우저별
     * @param statVo
     * @return
     */
    public String callLoginBrowser(StatVo statVo){
        ProcedureVo procedureVo = new ProcedureVo(statVo);
        List<P_LoginBrowserOutDetailVo> detailList =  con_LoginDao.callLoginBrowser(procedureVo);
        P_LoginBrowserOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginBrowserOutVo.class);

        if(Integer.parseInt(procedureVo.getRet()) <= 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음));
        }
        var result = new HashMap<String, Object>();
        result.put("totalInfo", totalInfo);
        result.put("detailList", detailList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }


}


