package com.dalbit.aop;

import com.dalbit.administrate.service.Adm_AuthorityService;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.MenuVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 공통 rest controller AOP 정의
 */
@Slf4j
@Aspect
@Component
public class CommonRestControllerAop {

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpServletResponse response;

    @Autowired
    Adm_AuthorityService admAuthorityService;

    @Autowired
    CommonService commonService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 공통 컨트롤러 로깅처리
     * @param proceedingJoinPoint
     * @return
     * @throws Throwable
     */
    @Around("execution(* com.dalbit.*.controller.*.*(..))")
    public Object controllerLogger(ProceedingJoinPoint proceedingJoinPoint) throws GlobalException, Throwable {

        String proceedName = proceedingJoinPoint.getSignature().getDeclaringTypeName() + "." + proceedingJoinPoint.getSignature().getName();

        checkMenuAuth();

        log.debug("[AOP:controller] - start : " + proceedName);
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        Object result = proceedingJoinPoint.proceed();

        stopWatch.stop();

        log.info("[AOP:" + proceedName + "] - 실행시간 : " + stopWatch.getTotalTimeMillis() + " (ms)");
        log.info("실행결과 : " + result.toString());

        return result;
    }

    /**
     * 공통 REST 컨트롤러 로깅처리
     * @param proceedingJoinPoint
     * @return
     * @throws Throwable
     */
    @Around("execution(* com.dalbit.*.controller.rest.*.*(..))")
    public Object restControllerLogger(ProceedingJoinPoint proceedingJoinPoint) throws GlobalException, Throwable {

        String proceedName = proceedingJoinPoint.getSignature().getDeclaringTypeName() + "." + proceedingJoinPoint.getSignature().getName();

        restCheckMenuAuth();

        log.debug("[AOP:restController] - start : " + proceedName);
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        Object result = proceedingJoinPoint.proceed();

        stopWatch.stop();

        log.info("[AOP:" + proceedName + "] - 실행시간 : " + stopWatch.getTotalTimeMillis() + " (ms)");
        log.info("실행결과 : " + result.toString());

        return result;
    }


    private final String[] READ_URLS = {
        "list", "detail" , "excel", "hist", "search"
    };

    private final String[] INSERT_MODIFY_URLS = {
        "edit" , "insert", "update" , "operate"
    };

    private final String[] DELETE_URLS = {
        "delete"
    };

    /**
     * controller용 권한체크
     * @throws GlobalException
     */
    public void checkMenuAuth() throws GlobalException{
        if(DalbitUtil.isEmpty(MemberVo.getUserInfo())){
            return;
        }
        String curUrl = request.getRequestURL().toString();
        List<MenuVo> allMenuList = commonService.getMenuInfo(new MenuVo());
        List<MenuVo> myAuthMenuList = admAuthorityService.getMemberAuthInfo(MemberVo.getUserInfo().getEmp_no());

        MenuVo curMenu = allMenuList.stream().filter(menuVo -> !DalbitUtil.isEmpty(menuVo.getMenu_url()) && curUrl.contains(menuVo.getMenu_url())).findFirst().orElse(null);

        if(!DalbitUtil.isEmpty(curMenu)){
            MenuVo myAuthMenu = null;
            if(!DalbitUtil.isEmpty(curMenu)){
                myAuthMenu = myAuthMenuList.stream().filter(myMenu -> myMenu.getIdx() == curMenu.getIdx()).findFirst().orElse(null);
            }

            String callUrl = request.getRequestURI().toLowerCase();
            if(DalbitUtil.isEmpty(myAuthMenu)){
                throw new GlobalException(Status.권한없음);
            }

            for(String url : READ_URLS) {
                if(callUrl.contains(url)) {
                    if(myAuthMenu.getIs_read() != 1){
                        throw new GlobalException(Status.권한없음);
                    }
                    break;
                }
            }
        }
    }

    /**
     * rest controller용 권한체크
     * @throws GlobalException
     */
    public void restCheckMenuAuth()throws GlobalException{

        if(DalbitUtil.isEmpty(MemberVo.getUserInfo())){
            return;
        }

        String[] urlSplit = request.getRequestURL().toString().split("/rest/");
        if(DalbitUtil.isEmpty(request.getHeader("referer"))){
            return;
        }
        String referer = request.getHeader("referer").replaceAll(urlSplit[0], "");

        List<MenuVo> allMenuList = commonService.getMenuInfo(new MenuVo());
        List<MenuVo> myAuthMenuList = admAuthorityService.getMemberAuthInfo(MemberVo.getUserInfo().getEmp_no());

        MenuVo curMenu = allMenuList.stream().filter(menuVo -> !DalbitUtil.isEmpty(menuVo.getMenu_url()) && menuVo.getMenu_url().equals(referer)).findFirst().orElse(null);

        if(!DalbitUtil.isEmpty(curMenu)){
            MenuVo myAuthMenu = null;
            if(!DalbitUtil.isEmpty(curMenu)){
                myAuthMenu = myAuthMenuList.stream().filter(myMenu -> myMenu.getIdx() == curMenu.getIdx()).findFirst().orElse(null);
            }

            String callUrl = request.getRequestURI().toLowerCase();
            if(DalbitUtil.isEmpty(myAuthMenu)){
                throw new GlobalException(Status.권한없음);
            }

            boolean checked = false;

            for(String url : READ_URLS) {
                if(callUrl.contains(url)) {
                    checked = true;
                    if(myAuthMenu.getIs_read() != 1){
                        throw new GlobalException(Status.권한없음);
                    }
                    break;
                }
            }

            if(!checked){
                for(String url : INSERT_MODIFY_URLS) {
                    if(callUrl.contains(url)) {
                        checked = true;
                        if(myAuthMenu.getIs_insert() != 1){
                            throw new GlobalException(Status.권한없음);
                        }
                        break;
                    }
                }
            }

            if(!checked){
                for (String url : DELETE_URLS) {
                    if (callUrl.contains(url)) {
                        checked = true;
                        if (myAuthMenu.getIs_delete() != 1) {
                            throw new GlobalException(Status.권한없음);
                        }
                        break;
                    }
                }
            }
        }
    }
}
