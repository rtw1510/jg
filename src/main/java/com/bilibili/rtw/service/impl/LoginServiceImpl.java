package com.bilibili.rtw.service.impl;

import com.bilibili.rtw.beans.User;
import com.bilibili.rtw.dao.UserDao;
import com.bilibili.rtw.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    private UserDao userDao;
    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public User login(String username, String password) {
        User user = userDao.selectUser(username,password);
        if (user!=null){
            return user;
        }
        return null;
    }
}
