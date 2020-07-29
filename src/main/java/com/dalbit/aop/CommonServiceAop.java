package com.dalbit.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import javax.servlet.http.HttpServletRequest;

/**
 * 공통 service AOP 정의
 */
@Slf4j
@Aspect
@Component
public class CommonServiceAop {

    @Autowired
    HttpServletRequest request;

    /**
     * 전체 서비스 로깅
     * @param proceedingJoinPoint
     * @return
     * @throws Throwable
     */
    @Around("execution(* com.dalbit.*.service.*.*(..))")
    public Object serviceLogger(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {

        String proceedName = proceedingJoinPoint.getSignature().getDeclaringTypeName() + "." + proceedingJoinPoint.getSignature().getName();

        log.debug("[service] - start : " + proceedName);
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        Object result = proceedingJoinPoint.proceed();

        stopWatch.stop();

        log.info("[" + proceedName + "] - 실행시간 : " + stopWatch.getTotalTimeMillis() + " (ms)");

        return result;
    }

    @Around("execution(* com.dalbit.common.service.EmailService.sendEmail(..))")
    public Object emailServiceLogger(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {

        String proceedName = proceedingJoinPoint.getSignature().getDeclaringTypeName() + "." + proceedingJoinPoint.getSignature().getName();

        log.debug("[service] - start : " + proceedName);
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        request.setAttribute("datasource", "email");

        Object result = proceedingJoinPoint.proceed();

        request.removeAttribute("datasource");

        stopWatch.stop();

        log.info("[" + proceedName + "] - 실행시간 : " + stopWatch.getTotalTimeMillis() + " (ms)");

        return result;
    }
}
