package com.bilibili.rtw.service;

import com.bilibili.rtw.beans.User;

public interface LoginService {
    User login(String username,String password);
}
