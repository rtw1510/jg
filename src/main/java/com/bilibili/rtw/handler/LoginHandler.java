package com.bilibili.rtw.handler;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginHandler implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession userSession = request.getSession(false);
        if (userSession!=null && userSession.getAttribute("userManager")!=null){
          return true;
        }
        response.sendRedirect(request.getContextPath());
        return false;
    }


}
