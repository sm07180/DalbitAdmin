package com.dalbit.aop;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

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

        log.debug("[AOP:restController] - start : " + proceedName);
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        Object result = proceedingJoinPoint.proceed();

        stopWatch.stop();

        log.info("[AOP:" + proceedName + "] - 실행시간 : " + stopWatch.getTotalTimeMillis() + " (ms)");
        log.info("실행결과 : " + result.toString());

        return result;
    }
}
