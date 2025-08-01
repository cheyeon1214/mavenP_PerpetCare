package com.project.perpetcare.domain;

import com.project.perpetcare.domain.enums.Grade;

import java.util.Arrays;

public class User {
    private String email;
    private String name;
    private String bdate;
    private String gender;
    private String pwd;
    private String phone;
    private Grade grade;
    private byte[] image;

    public User(String email, String name, String bdate, String gender, String pwd, String phone, Grade grade) {
        this.email = email;
        this.name = name;
        this.bdate = bdate;
        this.gender = gender;
        this.pwd = pwd;
        this.phone = phone;
        this.grade = grade;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getBdate() {
        return bdate;
    }

    public void setBdate(String bdate) {
        this.bdate = bdate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "User{" +
                "email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", bdate='" + bdate + '\'' +
                ", gender='" + gender + '\'' +
                ", pwd='" + pwd + '\'' +
                ", phone='" + phone + '\'' +
                ", grade=" + grade +
                ", image=" + Arrays.toString(image) +
                '}';
    }
}
