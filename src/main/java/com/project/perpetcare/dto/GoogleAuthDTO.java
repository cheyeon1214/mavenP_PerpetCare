package com.project.perpetcare.dto;

import java.util.Arrays;

public class GoogleAuthDTO {
    private String uEmail;
    private String uName;
    private String uGender;
    private String uPhone;
    private String uGrade;
    private byte[] uImage;

    public GoogleAuthDTO(){}

    public GoogleAuthDTO(String uEmail, String uName, String uGender, String uPhone, String uGrade,byte[] uImage) {
        this.uEmail = uEmail;
        this.uName = uName;
        this.uGender = uGender;
        this.uPhone = uPhone;
        this.uGrade = uGrade;
        this.uImage = uImage;
    }

    public String getuEmail() {
        return uEmail;
    }
    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }
    public String getuName() {
        return uName;
    }
    public void setuName(String uName) {
        this.uName = uName;
    }
    public String getuGender() {
        return uGender;
    }
    public void setuGender(String uGender) {
        this.uGender = uGender;
    }
    public String getuPhone() {
        return uPhone;
    }
    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }
    public String getuGrade() {
        return uGrade;
    }
    public void setuGrade(String uGrade) {
        this.uGrade = uGrade;
    }
    public byte[] getuImage() { return  uImage; }
    public void setuImage(byte[] uImage) { this.uImage = uImage; }

    @Override
    public String toString() {
        return "GoogleAuthDTO{" +
                "uEmail='" + uEmail + '\'' +
                ", uName='" + uName + '\'' +
                ", uGender='" + uGender + '\'' +
                ", uPhone='" + uPhone + '\'' +
                ", uGrade='" + uGrade + '\'' +
                ", uImage=" + Arrays.toString(uImage) +
                '}';
    }
}
