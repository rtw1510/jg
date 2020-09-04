package com.bilibili.rtw.service;

import com.bilibili.rtw.beans.User;

import java.util.List;

public interface StaffService {
    List<User> listAllStaff();
    void updateStaff(User user);
    void deleteStaff(int id);
    void insertStaff(User user);
    int count();
    List<User> findStaffByPage(int id);
}
