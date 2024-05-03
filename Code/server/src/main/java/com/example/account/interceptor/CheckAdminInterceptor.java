package com.example.account.interceptor;

import com.example.account.interceptor.resource.CheckAdmin;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.Configuration;

@Configuration
@Aspect
public class CheckAdminInterceptor {
    private boolean enableScvResource = true;

    public boolean isEnableScvResource() {
        return enableScvResource;
    }

    public void setEnableScvResource(boolean enableScvResource) {
        this.enableScvResource = enableScvResource;
    }

    @Before("@annotation(checkAdmin)")
    public void checkPermission(JoinPoint joinPoint, CheckAdmin checkAdmin) {
        if (!enableScvResource) {
            return;
        }
        //验证是否有权限
        if (enableScvResource) {
            //TODO:权限控制逻辑

            String msg = "User is not permitted [" + checkAdmin.name() + "]";
        }

    }
}
