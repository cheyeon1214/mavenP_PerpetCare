package com.project.perpetcare.dto;

import java.time.LocalDateTime;
import java.util.Arrays;

public class ApplyUserDTO {
    // Apply 정보
    private int aNo;
    private int oNo;
    private String aText;
    private String aStatus;
    private LocalDateTime aCreatedAt;

    // User에서 필요한 정보만
    private String uEmail;
    private String uGrade;
    private byte[] uImage; // 프로필 이미지

    public int getaNo() {
        return aNo;
    }

    public void setaNo(int aNo) {
        this.aNo = aNo;
    }

    public int getoNo() {
        return oNo;
    }

    public void setoNo(int oNo) {
        this.oNo = oNo;
    }

    public String getaText() {
        return aText;
    }

    public void setaText(String aText) {
        this.aText = aText;
    }

    public String getaStatus() {
        return aStatus;
    }

    public void setaStatus(String aStatus) {
        this.aStatus = aStatus;
    }

    public LocalDateTime getaCreatedAt() {
        return aCreatedAt;
    }

    public void setaCreatedAt(LocalDateTime aCreatedAt) {
        this.aCreatedAt = aCreatedAt;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public String getuGrade() {
        return uGrade;
    }

    public void setuGrade(String uGrade) {
        this.uGrade = uGrade;
    }

    public byte[] getuImage() {
        return uImage;
    }

    public void setuImage(byte[] uImage) {
        this.uImage = uImage;
    }

    @Override
    public String toString() {
        return "ApplyUserDTO{" +
                "aNo=" + aNo +
                ", oNo=" + oNo +
                ", aText='" + aText + '\'' +
                ", aStatus='" + aStatus + '\'' +
                ", aCreatedAt=" + aCreatedAt +
                ", uEmail='" + uEmail + '\'' +
                ", uGrade='" + uGrade + '\'' +
                ", uImage=" + Arrays.toString(uImage) +
                '}';
    }
}
