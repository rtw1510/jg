package com.bilibili.rtw.dao;

import com.bilibili.rtw.beans.User;

import java.util.List;

public interface StaffDao {
    List<User> selectAll();
    void updateStaff(User user);
    void deleteByPrimaryKey(int id);
    void insertStaff(User user);
    int countStaff();
    List<User> selectByPage(int id);
}
