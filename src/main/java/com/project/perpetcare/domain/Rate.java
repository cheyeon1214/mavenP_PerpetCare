package com.project.perpetcare.domain;

import java.time.LocalDateTime;

public class Rate {
    private int no; //r_no
    private String fromEmail; //from_email
    private String toEmail; //to_email
    private int oNo; //o_no Opening 외래키
    private String textOfRate; //r_text
    private LocalDateTime createdAt; //r_createAt

    public Rate(){}
    public Rate( int no, String fromEmail, String toEmail, int oNo, String textOfRate, LocalDateTime createAt) {
        this.no = no;
        this.fromEmail = fromEmail;
        this.toEmail = toEmail;
        this.oNo = oNo;
        this.textOfRate = textOfRate;
        this.createdAt = createAt;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getFromEmail() {
        return fromEmail;
    }

    public void setFromEmail(String fromEmail) {
        this.fromEmail = fromEmail;
    }

    public String getToEmail() {
        return toEmail;
    }

    public void setToEmail(String toEmail) {
        this.toEmail = toEmail;
    }

    public int getoNo() {
        return oNo;
    }

    public void setoNo(int oNo) {
        this.oNo = oNo;
    }

    public String getTextOfRate() {
        return textOfRate;
    }

    public void setTextOfRate(String textOfRate) {
        this.textOfRate = textOfRate;
    }

    public LocalDateTime getCreateAt() {
        return createdAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createdAt = createAt;
    }

    @Override
    public String toString() {
        return "Rate{" +
                "no=" + no +
                ", fromEmail='" + fromEmail + '\'' +
                ", toEmail='" + toEmail + '\'' +
                ", oNo=" + oNo +
                ", textOfRate='" + textOfRate + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}
