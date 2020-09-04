package com.bilibili.rtw.dao;

import com.bilibili.rtw.beans.User;

public interface UserDao {
    User selectUser (String usrname, String password);
}
