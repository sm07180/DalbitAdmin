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

        //ip 접속자 수 조회
        List<HashMap> currentDuplIpInfo = con_LoginDao.currentIpDuplInfo();

        HashMap resultMap = new HashMap();
        resultMap.put("loginLive", loginLive);
        resultMap.put("currentDuplIpInfo", currentDuplIpInfo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultMap));
    }

    /**
     * 로그인 총계(중복)
     * @param pLoginTotalInPutVo
     * @return
     */
    public String callLoginTotalAll(P_LoginTotalInPutVo pLoginTotalInPutVo){

        ArrayList resultList = new ArrayList();
        String[] dateList = pLoginTotalInPutVo.getDateList().split("@");

        int slctType_date = 0;
        if(pLoginTotalInPutVo.getSlctType() == 0) {
            slctType_date = 24;
        }else if(pLoginTotalInPutVo.getSlctType() == 1) {
            slctType_date = 32;
        }else if(pLoginTotalInPutVo.getSlctType() == 2) {
            slctType_date = 13;
        }
        for(int i=0;i<dateList.length;i++){
            if(dateList[i].indexOf("-") > -1){
                pLoginTotalInPutVo.setStartDate(dateList[i].split("-")[0]);
                pLoginTotalInPutVo.setEndDate(dateList[i].split("-")[1]);
            }else{
                pLoginTotalInPutVo.setStartDate(dateList[i]);
                pLoginTotalInPutVo.setEndDate(null);
            }

            ProcedureVo procedureVo = new ProcedureVo(pLoginTotalInPutVo);
            List<P_LoginTotalOutDetailVo> detailList =  con_LoginDao.callLoginTotalAll(procedureVo);
            P_LoginTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginTotalOutVo.class);

            boolean zeroSw = false;
            if(detailList.size() < slctType_date){
                int detailList_size = detailList.size();
                for (int j = 0; j < slctType_date; j++) {
                    P_LoginTotalOutDetailVo outVo = new P_LoginTotalOutDetailVo();
                    for (int k = 0; k < detailList_size; k++){
                        if(pLoginTotalInPutVo.getSlctType() == 0) {
                            if (detailList.get(k).getHour() == j) {
                                zeroSw = true;
                                break;
                            }
                        }else if(pLoginTotalInPutVo.getSlctType() == 1) {
                            if (detailList.get(k).getDay() == j) {
                                detailList.get(k).setDay(j);
                                zeroSw = true;
                                break;
                            }
                        }else if(pLoginTotalInPutVo.getSlctType() == 2) {
                            if (detailList.get(k).getMonth() == j) {
                                detailList.get(k).setMonthly(j);
                                detailList.get(k).setDay(j);
                                zeroSw = true;
                                break;
                            }
                        }
                    }
                    if(!zeroSw){
                        outVo.setDay(j);
                        outVo.setHour(j);
                        outVo.setMonthly(j);
                        outVo.setTotalCnt(0);
                        outVo.setMaleCnt(0);
                        outVo.setFemaleCnt(0);
                        outVo.setNoneCnt(0);

                        detailList.add(outVo);
                    }
                }
            }

            var result = new HashMap<String, Object>();
            result.put("totalInfo", totalInfo);
            result.put("detailList", detailList);

            resultList.add(result);

        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultList));
    }

    /**
     * 로그인 총계
     * @param pLoginTotalInPutVo
     * @return
     */
    public String callLoginTotal(P_LoginTotalInPutVo pLoginTotalInPutVo){

        ArrayList resultList = new ArrayList();
        String[] dateList = pLoginTotalInPutVo.getDateList().split("@");

        int slctType_date = 0;
        if(pLoginTotalInPutVo.getSlctType() == 0) {
            slctType_date = 24;
        }else if(pLoginTotalInPutVo.getSlctType() == 1) {
            slctType_date = 32;
        }else if(pLoginTotalInPutVo.getSlctType() == 2) {
            slctType_date = 13;
        }
        for(int i=0;i<dateList.length;i++){
            if(dateList[i].indexOf("-") > -1){
                pLoginTotalInPutVo.setStartDate(dateList[i].split("-")[0]);
                pLoginTotalInPutVo.setEndDate(dateList[i].split("-")[1]);
            }else{
                pLoginTotalInPutVo.setStartDate(dateList[i]);
                pLoginTotalInPutVo.setEndDate(null);
            }

            ProcedureVo procedureVo = new ProcedureVo(pLoginTotalInPutVo);
            List<P_LoginTotalOutDetailVo> detailList =  con_LoginDao.callLoginTotal(procedureVo);
            P_LoginTotalOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginTotalOutVo.class);

            boolean zeroSw = false;
            if(detailList.size() < slctType_date){
                int detailList_size = detailList.size();
                for (int j = 0; j < slctType_date; j++) {
                    P_LoginTotalOutDetailVo outVo = new P_LoginTotalOutDetailVo();
                    for (int k = 0; k < detailList_size; k++){
                        if(pLoginTotalInPutVo.getSlctType() == 0) {
                            if (detailList.get(k).getHour() == j) {
                                zeroSw = true;
                                break;
                            }
                        }else if(pLoginTotalInPutVo.getSlctType() == 1) {
                            if (detailList.get(k).getDay() == j) {
                                detailList.get(k).setDay(j);
                                zeroSw = true;
                                break;
                            }
                        }else if(pLoginTotalInPutVo.getSlctType() == 2) {
                            if (detailList.get(k).getMonth() == j) {
                                detailList.get(k).setMonthly(j);
                                detailList.get(k).setDay(j);
                                zeroSw = true;
                                break;
                            }
                        }
                    }
                    if(!zeroSw){
                        outVo.setDay(j);
                        outVo.setHour(j);
                        outVo.setMonthly(j);
                        outVo.setTotalCnt(0);
                        outVo.setMaleCnt(0);
                        outVo.setFemaleCnt(0);
                        outVo.setNoneCnt(0);

                        detailList.add(outVo);
                    }
                }
            }

            var result = new HashMap<String, Object>();
            result.put("totalInfo", totalInfo);
            result.put("detailList", detailList);

            resultList.add(result);

        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultList));
    }

    /**
     * 로그인 연령대별
     * @param pLoginTotalInPutVo
     * @return
     */
    public String callLoginAge(P_LoginTotalInPutVo pLoginTotalInPutVo){


        ArrayList resultList = new ArrayList();
        String[] dateList = pLoginTotalInPutVo.getDateList().split("@");

        int slctType_date = 32;
        for(int i=0;i<dateList.length;i++){
            if(dateList[i].indexOf("-") > -1){
                pLoginTotalInPutVo.setStartDate(dateList[i].split("-")[0]);
                pLoginTotalInPutVo.setEndDate(dateList[i].split("-")[1]);
            }else{
                pLoginTotalInPutVo.setStartDate(dateList[i]);
                pLoginTotalInPutVo.setEndDate(null);
            }

            ProcedureVo procedureVo = new ProcedureVo(pLoginTotalInPutVo);
            List<P_LoginAgeOutDetailVo> detailList =  con_LoginDao.callLoginAge(procedureVo);
            P_LoginAgeOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginAgeOutVo.class);

            boolean zeroSw = false;
            if(detailList.size() < slctType_date){
                int detailList_size = detailList.size();
                for (int j = 0; j < slctType_date; j++) {
                    P_LoginAgeOutDetailVo outVo = new P_LoginAgeOutDetailVo();
                    for (int k = 0; k < detailList_size; k++){
                        if (detailList.get(k).getDay() == j) {
                            detailList.get(k).setDay(j);
                            zeroSw = true;
                            break;
                        }
                    }
                    if(!zeroSw){
                        outVo.setDay(j);
                        outVo.setHour(j);
                        outVo.setMonthly(j);
                        outVo.setTotalCnt(0);
                        outVo.setTotalCnt(0);
                        outVo.setAge10Cnt(0);
                        outVo.setAge20Cnt(0);
                        outVo.setAge30Cnt(0);
                        outVo.setAge40Cnt(0);
                        outVo.setAge50Cnt(0);
                        outVo.setAge60Cnt(0);

                        detailList.add(outVo);
                    }
                }
            }
            var result = new HashMap<String, Object>();
            result.put("totalInfo", totalInfo);
            result.put("detailList", detailList);
            resultList.add(result);
        }
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultList));
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

        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy.MM.dd");

        String EndDate = statVo.getEndDate();
        String StartDate = statVo.getStartDate();
        String SelectMonth = StartDate.substring(5,7);

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
                // 해당월의 마지막 날짜 구하기  -------------------
                bEdate.setTime(eEDate.getTime());
                eCal.setTime(bEdate);
                Calendar cal = Calendar.getInstance();
                cal.set(eCal.get(Calendar.YEAR),eCal.get(Calendar.MONTH),eCal.get(Calendar.DATE));
                cal.add(Calendar.MONTH,-1);
                SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy.MM.dd");
                String tmp_endDate = cal.get(Calendar.YEAR) + "." + DalbitUtil.lpad(String.valueOf(cal.get(Calendar.MONTH) + 1),2,"0") + "." + cal.getActualMaximum(Calendar.DAY_OF_MONTH);
                // ----------------------------------------------
                EndDate = tmp_endDate;

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
        List<P_LoginBrowserOutDetailVo> bDetailList =  con_LoginDao.callLoginBrowser(procedureVo);
        P_LoginBrowserOutVo bTotalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginBrowserOutVo.class);


        log.info(procedureVo.getExt());

        P_LoginBrowserOutVo sumOutVo = new P_LoginBrowserOutVo();
        if(totalInfo.getSum_totalCnt() > 0) {
            sumOutVo.setSum_totalCnt(totalInfo.getSum_totalCnt());
            sumOutVo.setSum_androidCnt(totalInfo.getSum_androidCnt());
            sumOutVo.setSum_iosCnt(totalInfo.getSum_iosCnt());
            sumOutVo.setSum_pcCnt(totalInfo.getSum_pcCnt());
            sumOutVo.setSum_bTotalCnt(bTotalInfo.getSum_totalCnt());
            sumOutVo.setSum_bAndroidCnt(bTotalInfo.getSum_androidCnt());
            sumOutVo.setSum_bIosCnt(bTotalInfo.getSum_iosCnt());
            sumOutVo.setSum_bPcCnt(bTotalInfo.getSum_pcCnt());
        }else{
            sumOutVo.setSum_totalCnt(0);
            sumOutVo.setSum_androidCnt(0);
            sumOutVo.setSum_iosCnt(0);
            sumOutVo.setSum_pcCnt(0);
            sumOutVo.setSum_bTotalCnt(0);
            sumOutVo.setSum_bAndroidCnt(0);
            sumOutVo.setSum_bIosCnt(0);
            sumOutVo.setSum_bPcCnt(0);
        }



        List list = new ArrayList();
        if(statVo.getSlctType() == 0){              // 시간별
            for (int i=0; i < detailList.size(); i++){
                P_LoginBrowserOutDetailVo outVo = new P_LoginBrowserOutDetailVo();
                outVo.setDate(detailList.get(i).getDate());
                outVo.setHour(detailList.get(i).getHour());
                outVo.setYear(detailList.get(i).getYear());
                outVo.setMonth(detailList.get(i).getMonth());
                outVo.setDay(detailList.get(i).getDay());
                outVo.setTotalCnt(detailList.get(i).getTotalCnt());
                outVo.setAndroidCnt(detailList.get(i).getAndroidCnt());
                outVo.setIosCnt(detailList.get(i).getIosCnt());
                outVo.setPcCnt(detailList.get(i).getPcCnt());

                boolean tmpSw = false;
                if(!DalbitUtil.isEmpty(bDetailList)){
                    for(int j=0;j<bDetailList.size();j++){
                        if(detailList.get(i).getHour().equals(bDetailList.get(j).getHour())){
                            outVo.setBTotalCnt(bDetailList.get(j).getTotalCnt());
                            outVo.setBAndroidCnt(bDetailList.get(j).getAndroidCnt());
                            outVo.setBIosCnt(bDetailList.get(j).getIosCnt());
                            outVo.setBPcCnt(bDetailList.get(j).getPcCnt());
                            tmpSw = true;
                            break;
                        }
                    }
                }
                if(!tmpSw){
                    outVo.setBTotalCnt(0);
                    outVo.setBAndroidCnt(0);
                    outVo.setBIosCnt(0);
                    outVo.setBPcCnt(0);
                }
                list.add(outVo);
            }
        }else if(statVo.getSlctType() == 1) {       // 일별
            for (int i=30; -1 < i; i --){
                P_LoginBrowserOutDetailVo outVo = new P_LoginBrowserOutDetailVo();
                outVo.setDay(Integer.toString(i+1));
                outVo.setMonth(SelectMonth);

                if(detailList.size() >= i+1) {
                    if (detailList.get(i).getDay().equals(Integer.toString(i+1))) {
                        outVo.setTotalCnt(detailList.get(i).getTotalCnt());
                        outVo.setAndroidCnt(detailList.get(i).getAndroidCnt());
                        outVo.setIosCnt(detailList.get(i).getIosCnt());
                        outVo.setPcCnt(detailList.get(i).getPcCnt());
                    }else{
                        outVo.setTotalCnt(0);
                        outVo.setAndroidCnt(0);
                        outVo.setIosCnt(0);
                        outVo.setPcCnt(0);
                    }
                }else{
                    outVo.setTotalCnt(0);
                    outVo.setAndroidCnt(0);
                    outVo.setIosCnt(0);
                    outVo.setPcCnt(0);
                }

                if(bDetailList.size() >= i+1) {
                    if (bDetailList.get(i).getDay().equals(Integer.toString(i+1))) {
                        outVo.setBTotalCnt(bDetailList.get(i).getTotalCnt());
                        outVo.setBAndroidCnt(bDetailList.get(i).getAndroidCnt());
                        outVo.setBIosCnt(bDetailList.get(i).getIosCnt());
                        outVo.setBPcCnt(bDetailList.get(i).getPcCnt());
                    }else{
                        outVo.setBTotalCnt(0);
                        outVo.setBAndroidCnt(0);
                        outVo.setBIosCnt(0);
                        outVo.setBPcCnt(0);
                    }
                }else{
                    outVo.setBTotalCnt(0);
                    outVo.setBAndroidCnt(0);
                    outVo.setBIosCnt(0);
                    outVo.setBPcCnt(0);
                }
                list.add(outVo);
            }
        }else{      // 월별
            for (int i=0; i < detailList.size(); i++){
                P_LoginBrowserOutDetailVo outVo = new P_LoginBrowserOutDetailVo();
                outVo.setDate(detailList.get(i).getDate());
                outVo.setHour(detailList.get(i).getHour());
                outVo.setYear(detailList.get(i).getYear());
                outVo.setMonth(detailList.get(i).getMonth());
                outVo.setDay(detailList.get(i).getDay());
                outVo.setTotalCnt(detailList.get(i).getTotalCnt());
                outVo.setAndroidCnt(detailList.get(i).getAndroidCnt());
                outVo.setIosCnt(detailList.get(i).getIosCnt());
                outVo.setPcCnt(detailList.get(i).getPcCnt());

                boolean tmpSw = false;
                if(!DalbitUtil.isEmpty(bDetailList)){
                    for(int j=0;j<bDetailList.size();j++){
                        if(detailList.get(i).getMonth().equals(bDetailList.get(j).getMonth())){
                            outVo.setBTotalCnt(bDetailList.get(j).getTotalCnt());
                            outVo.setBAndroidCnt(bDetailList.get(j).getAndroidCnt());
                            outVo.setBIosCnt(bDetailList.get(j).getIosCnt());
                            outVo.setBPcCnt(bDetailList.get(j).getPcCnt());
                            tmpSw = true;
                            break;
                        }
                    }
                }
                if(!tmpSw){
                    outVo.setBTotalCnt(0);
                    outVo.setBAndroidCnt(0);
                    outVo.setBIosCnt(0);
                    outVo.setBPcCnt(0);
                }
                list.add(outVo);
            }
        }

        var result = new HashMap<String, Object>();
        result.put("totalInfo", sumOutVo);
        result.put("detailList", list);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }

    /**
     * 로그인 현황 (연간별 / 주간)
     * @return
     */
    public String callLoginTotalWeek(StatVo statVo){
        ProcedureVo procedureVo = new ProcedureVo(statVo);
        List<P_LoginTotalOutDetailVo> list =  con_LoginDao.callLoginTotalWeek(procedureVo);
        P_LoginBrowserOutVo sumOutVo = new Gson().fromJson(procedureVo.getExt(), P_LoginBrowserOutVo.class);

        var result = new HashMap<String, Object>();
        result.put("totalInfo", sumOutVo);
        result.put("detailList", list);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, result));
    }


}


