package com.bilibili.rtw.beans;

public class User {
   private Integer id;
   private String username;
   private String password;
   private String position;
   private String positionGrade;

    public User() {
    }

    public User(Integer id, String username, String password, String position, String positionGrade) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.position = position;
        this.positionGrade = positionGrade;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPositionGrade() {
        return positionGrade;
    }

    public void setPositionGrade(String positionGrade) {
        this.positionGrade = positionGrade;
    }

    @Override
    public String toString() {
        return "user{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", position='" + position + '\'' +
                ", positionGrade='" + positionGrade + '\'' +
                '}';
    }
}
