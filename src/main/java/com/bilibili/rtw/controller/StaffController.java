package com.bilibili.rtw.controller;

import com.bilibili.rtw.beans.User;
import com.bilibili.rtw.service.impl.StaffServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/staff")
public class StaffController {
    private StaffServiceImpl staffServiceImpl;
    @Autowired
    public void setStaffServiceImpl(StaffServiceImpl staffServiceImpl) {
        this.staffServiceImpl = staffServiceImpl;
    }
    /*@RequestMapping("/list")
    public ModelAndView listStaff(){
        ModelAndView mv = new ModelAndView();
        List<User> staffs = staffServiceImpl.listAllStaff();
        int num = staffServiceImpl.count();
        mv.addObject("staffs",staffs);
        mv.addObject("num",num);
        mv.setViewName("cstpage/cst-list");
        return mv;
    }*/
    @RequestMapping("/update")
    @ResponseBody
    public String updateStaff(User user){
        staffServiceImpl.updateStaff(user);
//        System.out.println(user);
        return "staff/list?page=";
    }
    @RequestMapping("/delete")
    @ResponseBody
    public String deleteStaff(int id){
        staffServiceImpl.deleteStaff(id);
//        System.out.println(id);
        return "staff/list";
    }
    @RequestMapping("/insert")
    @ResponseBody
    public String insertStaff(User user){
        staffServiceImpl.insertStaff(user);
        return "staff/list";
    }
    @RequestMapping("/list")
    @ResponseBody
    public ModelAndView listByPage (Integer page, HttpServletRequest request){
//        Integer pageNum = Integer.parseInt(request.getParameter("page"));
        int start = page==null?0:(page-1)*5;
        int num = staffServiceImpl.count();
        int allPageNum = num%5 == 0?num/5:num/5+1;
        List<User> staffPage = staffServiceImpl.findStaffByPage(start);
//      System.out.println(staffPage);
        ModelAndView mv = new ModelAndView();
        mv.addObject("start",start);
        mv.addObject("num",num);
        mv.addObject("allPageNum",allPageNum);
        mv.addObject("staffPage",staffPage);
        mv.addObject("page",page);
        mv.setViewName("cstpage/cst-list");
        return mv;
    }
}
