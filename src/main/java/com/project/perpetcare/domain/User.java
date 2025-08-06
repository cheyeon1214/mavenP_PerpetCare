package com.project.perpetcare.domain;

import com.project.perpetcare.domain.enums.Grade;

import java.lang.reflect.Array;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;

public class User {
    private String email; //u_email
    private String name; //u_name
    private LocalDate bdate; //u_bdate
    private String gender; //u_gender
    private String pwd; //u_pwd
    private String phone; //u_phone
    private Grade grade; //u_grade
    private int image; //u_image
    private ArrayList<Experience> experiences;
    private ArrayList<Opening> openings;
    private ArrayList<Apply> applies;
    private ArrayList<Pet> pets;
    private ArrayList<Rate> rates;

    public User(){}

    public User(String email, String name, LocalDate bdate, String gender, String pwd, String phone, Grade grade, int image) {
        this.email = email;
        this.name = name;
        this.bdate = bdate;
        this.gender = gender;
        this.pwd = pwd;
        this.phone = phone;
        this.grade = grade;
        this.image = image;
    }
    public User(String email, String pwd){
        this.email = email;
        this.pwd = pwd;
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

    public LocalDate getBdate() {
        return bdate;
    }

    public void setBdate(LocalDate bdate) {
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

    public int getImage() {
        return image;
    }

    public void setImage(int image) {
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
                ", image=" + image +
                '}';
    }
}
