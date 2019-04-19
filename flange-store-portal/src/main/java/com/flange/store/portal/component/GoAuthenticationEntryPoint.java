package com.flange.store.portal.component;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>
 * 5:30 PM
 */
public class GoAuthenticationEntryPoint implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        response.setHeader("Content-Type", "application/json;charset=utf-8");
        response.getWriter().print("{\"code\":403,\"message\":\""+"未授权："+authException.getMessage()+"\"}");
        response.getWriter().flush();
    }
}
