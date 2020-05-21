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
import io.swagger.models.auth.In;
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
        String SelectMonth = StartDate.substring(5,7);
        // 선택한 달

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
                StartDate = String.valueOf(sCal.get(Calendar.YEAR)) + "."
                            + DalbitUtil.lpad(String.valueOf(sCal.get(Calendar.MONTH)),2,"0") + "."
                            + DalbitUtil.lpad(String.valueOf(sCal.get(Calendar.DATE)),2,"0");
            }else if(statVo.getSlctType() == 2) {
                bEdate.setTime(eEDate.getTime());
                eCal.setTime(bEdate);
                eCal.add(eCal.YEAR,-1);
                EndDate = String.valueOf(eCal.get(Calendar.YEAR)) + ".12.31";

                bSdate.setTime(bSDate.getTime());
                sCal.setTime(bSdate);
                sCal.add(sCal.YEAR,-1);
                StartDate = String.valueOf(sCal.get(Calendar.YEAR)) + ".01.01";
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
        if(statVo.getSlctType() != 1){
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

                if(!DalbitUtil.isEmpty(bDetailList)){
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
                }else{
                    outVo.setBTotalCnt(0);
                    outVo.setBMaleCnt(0);
                    outVo.setBFemaleCnt(0);
                    outVo.setBNoneCnt(0);
                }
                list.add(outVo);
            }
        }else if(statVo.getSlctType() == 1) {
            boolean detailListSw = false;
            boolean bDetailListSw = false;
            for (int i=0; i < 31; i++){
                P_LoginTotalOutDetailVo outVo = new P_LoginTotalOutDetailVo();
                outVo.setDay(Integer.toString(i + 1));
                outVo.setMonth(SelectMonth);
                for (int j = 0; j < detailList.size(); j++) {
                    if(detailList.size() > i) {
                        if (Integer.parseInt(detailList.get(j).getDay()) == i + 1) {
                            outVo.setTotalCnt(detailList.get(j).getTotalCnt());
                            outVo.setMaleCnt(detailList.get(j).getMaleCnt());
                            outVo.setFemaleCnt(detailList.get(j).getFemaleCnt());
                            outVo.setNoneCnt(detailList.get(j).getNoneCnt());
                            detailListSw = true;
                            break;
                        }
                    }else{
                        outVo.setTotalCnt(0);
                        outVo.setMaleCnt(0);
                        outVo.setFemaleCnt(0);
                        outVo.setNoneCnt(0);
                        detailListSw = true;
                        break;
                    }
                }
                for (int j = 0; j < bDetailList.size(); j++) {
                    if(bDetailList.size() > i){
                        if (Integer.parseInt(bDetailList.get(j).getDay()) == i + 1) {
                            outVo.setBTotalCnt(bDetailList.get(j).getTotalCnt());
                            outVo.setBMaleCnt(bDetailList.get(j).getMaleCnt());
                            outVo.setBFemaleCnt(bDetailList.get(j).getFemaleCnt());
                            outVo.setBNoneCnt(bDetailList.get(j).getNoneCnt());
                            bDetailListSw = true;
                            break;
                        }
                    }else{
                        outVo.setBTotalCnt(0);
                        outVo.setBMaleCnt(0);
                        outVo.setBFemaleCnt(0);
                        outVo.setBNoneCnt(0);
                        bDetailListSw = true;
                        break;
                    }
                }
                if(!detailListSw){
                    outVo.setTotalCnt(0);
                    outVo.setMaleCnt(0);
                    outVo.setFemaleCnt(0);
                    outVo.setNoneCnt(0);
                }
                if(!bDetailListSw){
                    outVo.setBTotalCnt(0);
                    outVo.setBMaleCnt(0);
                    outVo.setBFemaleCnt(0);
                    outVo.setBNoneCnt(0);
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
     * 로그인 연령대별
     * @param statVo
     * @return
     */
    public String callLoginAge(StatVo statVo){
        ProcedureVo procedureVo = new ProcedureVo(statVo);
        List<P_LoginAgeOutDetailVo> detailList =  con_LoginDao.callLoginAge(procedureVo);
        P_LoginAgeOutVo totalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginAgeOutVo.class);

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
        List<P_LoginAgeOutDetailVo> bDetailList =  con_LoginDao.callLoginAge(procedureVo);
        P_LoginAgeOutVo bTotalInfo = new Gson().fromJson(procedureVo.getExt(), P_LoginAgeOutVo.class);


        log.info(procedureVo.getExt());

        P_LoginAgeOutVo sumOutVo = new P_LoginAgeOutVo();
        if(totalInfo.getSum_totalCnt() > 0) {
            sumOutVo.setSum_totalCnt(totalInfo.getSum_totalCnt());
            sumOutVo.setSum_age10Cnt(totalInfo.getSum_age10Cnt());
            sumOutVo.setSum_age20Cnt(totalInfo.getSum_age20Cnt());
            sumOutVo.setSum_age30Cnt(totalInfo.getSum_age30Cnt());
            sumOutVo.setSum_age40Cnt(totalInfo.getSum_age40Cnt());
            sumOutVo.setSum_age50Cnt(totalInfo.getSum_age50Cnt());
            sumOutVo.setSum_age60Cnt(totalInfo.getSum_age60Cnt());
            sumOutVo.setSum_bTotalCnt(bTotalInfo.getSum_totalCnt());
            sumOutVo.setSum_bAge10Cnt(bTotalInfo.getSum_age10Cnt());
            sumOutVo.setSum_bAge20Cnt(bTotalInfo.getSum_age20Cnt());
            sumOutVo.setSum_bAge30Cnt(bTotalInfo.getSum_age30Cnt());
            sumOutVo.setSum_bAge40Cnt(bTotalInfo.getSum_age40Cnt());
            sumOutVo.setSum_bAge50Cnt(bTotalInfo.getSum_age50Cnt());
            sumOutVo.setSum_bAge60Cnt(bTotalInfo.getSum_age60Cnt());
        }else{
            sumOutVo.setSum_totalCnt(0);
            sumOutVo.setSum_age10Cnt(0);
            sumOutVo.setSum_age20Cnt(0);
            sumOutVo.setSum_age30Cnt(0);
            sumOutVo.setSum_age40Cnt(0);
            sumOutVo.setSum_age50Cnt(0);
            sumOutVo.setSum_age60Cnt(0);
            sumOutVo.setSum_bTotalCnt(0);
            sumOutVo.setSum_bAge10Cnt(0);
            sumOutVo.setSum_bAge20Cnt(0);
            sumOutVo.setSum_bAge30Cnt(0);
            sumOutVo.setSum_bAge40Cnt(0);
            sumOutVo.setSum_bAge50Cnt(0);
            sumOutVo.setSum_bAge60Cnt(0);
        }

        List list = new ArrayList();
        if(statVo.getSlctType() != 1){
            for (int i=0; i < detailList.size(); i++){
                P_LoginAgeOutDetailVo outVo = new P_LoginAgeOutDetailVo();
                outVo.setDate(detailList.get(i).getDate());
                outVo.setHour(detailList.get(i).getHour());
                outVo.setYear(detailList.get(i).getYear());
                outVo.setMonth(detailList.get(i).getMonth());
                outVo.setDay(detailList.get(i).getDay());

                outVo.setTotalCnt(detailList.get(i).getTotalCnt());
                outVo.setAge10Cnt(detailList.get(i).getAge10Cnt());
                outVo.setAge20Cnt(detailList.get(i).getAge20Cnt());
                outVo.setAge30Cnt(detailList.get(i).getAge30Cnt());
                outVo.setAge40Cnt(detailList.get(i).getAge40Cnt());
                outVo.setAge50Cnt(detailList.get(i).getAge50Cnt());
                outVo.setAge60Cnt(detailList.get(i).getAge60Cnt());
                if(!DalbitUtil.isEmpty(bDetailList)){
                    if(i < bDetailList.size()){
                        outVo.setBTotalCnt(bDetailList.get(i).getTotalCnt());
                        outVo.setBAge10Cnt(bDetailList.get(i).getAge10Cnt());
                        outVo.setBAge20Cnt(bDetailList.get(i).getAge20Cnt());
                        outVo.setBAge30Cnt(bDetailList.get(i).getAge30Cnt());
                        outVo.setBAge40Cnt(bDetailList.get(i).getAge40Cnt());
                        outVo.setBAge50Cnt(bDetailList.get(i).getAge50Cnt());
                        outVo.setBAge60Cnt(bDetailList.get(i).getAge60Cnt());
                    }else{
                        outVo.setBTotalCnt(0);
                        outVo.setBAge10Cnt(0);
                        outVo.setBAge20Cnt(0);
                        outVo.setBAge30Cnt(0);
                        outVo.setBAge40Cnt(0);
                        outVo.setBAge50Cnt(0);
                        outVo.setBAge60Cnt(0);
                    }
                }else{
                    outVo.setBTotalCnt(0);
                    outVo.setBAge10Cnt(0);
                    outVo.setBAge20Cnt(0);
                    outVo.setBAge30Cnt(0);
                    outVo.setBAge40Cnt(0);
                    outVo.setBAge50Cnt(0);
                    outVo.setBAge60Cnt(0);
                }
                list.add(outVo);
            }
        }else if(statVo.getSlctType() == 1) {
            boolean detailListSw = false;
            boolean bDetailListSw = false;
            for (int i=0; i < 31; i++){
                P_LoginAgeOutDetailVo outVo = new P_LoginAgeOutDetailVo();
                outVo.setDay(Integer.toString(i + 1));
                outVo.setMonth(SelectMonth);
                for (int j = 0; j < detailList.size(); j++) {
                    if(detailList.size() > i) {
                        if (Integer.parseInt(detailList.get(j).getDay()) == i + 1) {
                            outVo.setTotalCnt(detailList.get(i).getTotalCnt());
                            outVo.setAge10Cnt(detailList.get(i).getAge10Cnt());
                            outVo.setAge20Cnt(detailList.get(i).getAge20Cnt());
                            outVo.setAge30Cnt(detailList.get(i).getAge30Cnt());
                            outVo.setAge40Cnt(detailList.get(i).getAge40Cnt());
                            outVo.setAge50Cnt(detailList.get(i).getAge50Cnt());
                            outVo.setAge60Cnt(detailList.get(i).getAge60Cnt());
                            detailListSw = true;
                            break;
                        }
                    }else{
                        outVo.setTotalCnt(0);
                        outVo.setAge10Cnt(0);
                        outVo.setAge20Cnt(0);
                        outVo.setAge30Cnt(0);
                        outVo.setAge40Cnt(0);
                        outVo.setAge50Cnt(0);
                        outVo.setAge60Cnt(0);
                        detailListSw = true;
                        break;
                    }
                }
                for (int j = 0; j < bDetailList.size(); j++) {
                    if(bDetailList.size() > i){
                        if (Integer.parseInt(bDetailList.get(j).getDay()) == i + 1) {
                            outVo.setBTotalCnt(bDetailList.get(i).getTotalCnt());
                            outVo.setBAge10Cnt(bDetailList.get(i).getAge10Cnt());
                            outVo.setBAge20Cnt(bDetailList.get(i).getAge20Cnt());
                            outVo.setBAge30Cnt(bDetailList.get(i).getAge30Cnt());
                            outVo.setBAge40Cnt(bDetailList.get(i).getAge40Cnt());
                            outVo.setBAge50Cnt(bDetailList.get(i).getAge50Cnt());
                            outVo.setBAge60Cnt(bDetailList.get(i).getAge60Cnt());
                            bDetailListSw = true;
                            break;
                        }
                    }else{
                        outVo.setBTotalCnt(0);
                        outVo.setBAge10Cnt(0);
                        outVo.setBAge20Cnt(0);
                        outVo.setBAge30Cnt(0);
                        outVo.setBAge40Cnt(0);
                        outVo.setBAge50Cnt(0);
                        outVo.setBAge60Cnt(0);
                        bDetailListSw = true;
                        break;
                    }
                }
                if(!detailListSw){
                    outVo.setTotalCnt(0);
                    outVo.setAge10Cnt(0);
                    outVo.setAge20Cnt(0);
                    outVo.setAge30Cnt(0);
                    outVo.setAge40Cnt(0);
                    outVo.setAge50Cnt(0);
                    outVo.setAge60Cnt(0);
                }
                if(!bDetailListSw){
                    outVo.setBTotalCnt(0);
                    outVo.setBAge10Cnt(0);
                    outVo.setBAge20Cnt(0);
                    outVo.setBAge30Cnt(0);
                    outVo.setBAge40Cnt(0);
                    outVo.setBAge50Cnt(0);
                    outVo.setBAge60Cnt(0);
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

        if(statVo.getSlctType() != 1){
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
                if(!DalbitUtil.isEmpty(bDetailList)){
                    if(i < bDetailList.size()){
                        outVo.setBTotalCnt(bDetailList.get(i).getTotalCnt());
                        outVo.setBAndroidCnt(bDetailList.get(i).getAndroidCnt());
                        outVo.setBIosCnt(bDetailList.get(i).getIosCnt());
                        outVo.setBPcCnt(bDetailList.get(i).getPcCnt());
                    }else{
                        outVo.setBTotalCnt(0);
                        outVo.setBTotalCnt(0);
                        outVo.setBAndroidCnt(0);
                        outVo.setBIosCnt(0);
                        outVo.setBPcCnt(0);
                    }
                }else{
                    outVo.setBTotalCnt(0);
                    outVo.setBTotalCnt(0);
                    outVo.setBAndroidCnt(0);
                    outVo.setBIosCnt(0);
                    outVo.setBPcCnt(0);
                }
                list.add(outVo);
            }
        }else if(statVo.getSlctType() == 1) {
            boolean detailListSw = false;
            boolean bDetailListSw = false;
            for (int i=0; i < 31; i++){
                P_LoginBrowserOutDetailVo outVo = new P_LoginBrowserOutDetailVo();
                outVo.setDay(Integer.toString(i + 1));
                outVo.setMonth(SelectMonth);
                for (int j = 0; j < detailList.size(); j++) {
                    if(detailList.size() > i) {
                        if (Integer.parseInt(detailList.get(j).getDay()) == i + 1) {
                            outVo.setTotalCnt(detailList.get(i).getTotalCnt());
                            outVo.setAndroidCnt(detailList.get(i).getAndroidCnt());
                            outVo.setIosCnt(detailList.get(i).getIosCnt());
                            outVo.setPcCnt(detailList.get(i).getPcCnt());
                            detailListSw = true;
                            break;
                        }
                    }else{
                        outVo.setTotalCnt(0);
                        outVo.setAndroidCnt(0);
                        outVo.setIosCnt(0);
                        outVo.setPcCnt(0);
                        detailListSw = true;
                        break;
                    }
                }
                for (int j = 0; j < bDetailList.size(); j++) {
                    if(bDetailList.size() > i){
                        if (Integer.parseInt(bDetailList.get(j).getDay()) == i + 1) {
                            outVo.setBTotalCnt(bDetailList.get(i).getTotalCnt());
                            outVo.setBAndroidCnt(bDetailList.get(i).getAndroidCnt());
                            outVo.setBIosCnt(bDetailList.get(i).getIosCnt());
                            outVo.setBPcCnt(bDetailList.get(i).getPcCnt());
                            bDetailListSw = true;
                            break;
                        }
                    }else{
                        outVo.setBTotalCnt(0);
                        outVo.setBTotalCnt(0);
                        outVo.setBAndroidCnt(0);
                        outVo.setBIosCnt(0);
                        outVo.setBPcCnt(0);
                        bDetailListSw = true;
                        break;
                    }
                }
                if(!detailListSw){
                    outVo.setTotalCnt(0);
                    outVo.setAndroidCnt(0);
                    outVo.setIosCnt(0);
                    outVo.setPcCnt(0);
                }
                if(!bDetailListSw){
                    outVo.setBTotalCnt(0);
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


}


