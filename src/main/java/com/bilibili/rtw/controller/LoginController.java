package com.bilibili.rtw.controller;

import com.bilibili.rtw.beans.User;
import com.bilibili.rtw.service.impl.LoginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/user")
public class LoginController {
    private LoginServiceImpl loginServiceImpl;
    @Autowired
    public void setLoginServiceImpl(LoginServiceImpl loginServiceImpl) {
        this.loginServiceImpl = loginServiceImpl;
    }
    @RequestMapping("/login")
    @ResponseBody
    public String daoLogin(String username, String password, HttpServletRequest request){
        User user = loginServiceImpl.login(username, password);
        if (user!=null){
            HttpSession session = request.getSession();
            session.setAttribute("userManager",user);
            return "{\"login\":true}";
        }
        return "{\"login\":false}";
    }
    @RequestMapping("/index")
    public String logintz(){
        return "index";
    }

}
