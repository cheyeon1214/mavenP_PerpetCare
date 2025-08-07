package com.project.perpetcare.domain;

import java.time.LocalDateTime;
import java.util.ArrayList;

public class Opening {
    private Integer no; //o_no
    private String uEmail; //u_email User의 외래키
    private LocalDateTime createdAt; //o_createdAt
    private String careWay; //o_careway
    private LocalDateTime sDate; //o_sdate
    private LocalDateTime eDate; //o_edate
    private String price; //o_price
    private String per; //o_per
    private String location; //o_location
    private String prefer; //o_prefer
    private String detail; //o_detail
    private boolean close; //o_close
    private ArrayList<Pet> pets;
    private ArrayList<Apply> applies;

    public Opening(){}
    public Opening(int no, String uEmail, LocalDateTime createdAt, String careWay, LocalDateTime sDate, LocalDateTime eDate, String price, String per,  String location, String prefer, String detail, boolean close, ArrayList<Pet> pets) {
        this.no = no;
        this.uEmail = uEmail;
        this.createdAt = createdAt;
        this.careWay = careWay;
        this.sDate = sDate;
        this.eDate = eDate;
        this.price = price;
        this.per = per;
        this.location = location;
        this.prefer = prefer;
        this.detail = detail;
        this.close = close;
        this.pets = pets;
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

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getCareWay() {
        return careWay;
    }

    public void setCareWay(String careWay) {
        this.careWay = careWay;
    }

    public LocalDateTime getsDate() {
        return sDate;
    }

    public void setsDate(LocalDateTime sDate) {
        this.sDate = sDate;
    }

    public LocalDateTime geteDate() {
        return eDate;
    }

    public void seteDate(LocalDateTime eDate) {
        this.eDate = eDate;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPer() {
        return per;
    }

    public void setPer(String per) {
        this.per = per;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPrefer() {
        return prefer;
    }

    public void setPrefer(String prefer) {
        this.prefer = prefer;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public boolean isClose() {
        return close;
    }

    public void setClose(boolean close) {
        this.close = close;
    }

    public ArrayList<Pet> getPets() {
        return pets;
    }

    public void setPets(ArrayList<Pet> pets) {
        this.pets = pets;
    }

    public ArrayList<Apply> getApplies() {
        return applies;
    }

    public void setApplies(ArrayList<Apply> applies) {
        this.applies = applies;
    }

    @Override
    public String toString() {
        return "Opening{" +
                "no=" + no +
                ", uEmail='" + uEmail + '\'' +
                ", createdAt=" + createdAt +
                ", careWay='" + careWay + '\'' +
                ", sDate=" + sDate +
                ", eDate=" + eDate +
                ", price='" + price + '\'' +
                ", per='" + per + '\'' +
                ", location='" + location + '\'' +
                ", prefer='" + prefer + '\'' +
                ", detail='" + detail + '\'' +
                ", close=" + close +
                ", pets=" + pets +
                ", applies=" + applies +
                '}';
    }
}
