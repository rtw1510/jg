package com.bilibili.rtw.service.impl;

import com.bilibili.rtw.beans.User;
import com.bilibili.rtw.dao.StaffDao;
import com.bilibili.rtw.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StaffServiceImpl implements
        StaffService {
    private StaffDao staffDao;
    @Autowired
    public void setStaffDao(StaffDao staffDao) {
        this.staffDao = staffDao;
    }

    public List<User> listAllStaff() {
        List<User> staffs = staffDao.selectAll();
        return staffs;
    }

    public void updateStaff(User user) {
        staffDao.updateStaff(user);
    }

    public void deleteStaff(int id) {
        staffDao.deleteByPrimaryKey(id);
    }

    public void insertStaff(User user) {
        staffDao.insertStaff(user);
    }

    public int count() {
        int num = staffDao.countStaff();
        return num;
    }

    public List<User> findStaffByPage(int id) {
        List<User> staff = staffDao.selectByPage(id);
        return staff;
    }

}
