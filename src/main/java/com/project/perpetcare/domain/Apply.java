package com.project.perpetcare.domain;

import com.project.perpetcare.domain.enums.ApplyStatus;

import java.time.LocalDateTime;

public class Apply {
    private int no; //a_no
    private String uEmail; //u_email User 외래키
    private int oNo; //o_no Opening 외래키
    private LocalDateTime createdAt; //a_createAt
    private String text; //a_text
    private ApplyStatus applyStatus; //a_status

    public Apply(){}
    public Apply(int no, String uEmail, int oNo, LocalDateTime createdAt, String text, ApplyStatus applyStatus) {
        this.no = no;
        this.uEmail = uEmail;
        this.oNo = oNo;
        this.createdAt = createdAt;
        this.text = text;
        this.applyStatus = applyStatus;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public int getoNo() {
        return oNo;
    }

    public void setoNo(int oNo) {
        this.oNo = oNo;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public ApplyStatus getApplyStatus() {
        return applyStatus;
    }

    public void setApplyStatus(ApplyStatus applyStatus) {
        this.applyStatus = applyStatus;
    }

    @Override
    public String toString() {
        return "Apply{" +
                "no='" + no + '\'' +
                ", uEmail='" + uEmail + '\'' +
                ", oNo='" + oNo + '\'' +
                ", createdAt=" + createdAt +
                ", text='" + text + '\'' +
                ", applyStatus=" + applyStatus +
                '}';
    }
}
