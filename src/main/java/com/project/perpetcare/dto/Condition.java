package com.project.perpetcare.dto;

import com.project.perpetcare.domain.Pet;

import java.time.LocalDateTime;
import java.util.ArrayList;

public class Condition {
    private Boolean closeFilter; // 컬럼명 o_close
    private LocalDateTime sdate; // 컬럼명 o_sdate
    private LocalDateTime edate; // 컬럼명 o_edate
    private String location; // 컬럼명 o_location
    private String careWay; // 컬럼명 o_careway
    private String species; // Opening -> Pet -> species 를 가져온다
    private String orderBy; // recent 또는 old

    public Condition() {
    }
    public Condition(Boolean closeFilter, LocalDateTime sdate, LocalDateTime edate, String location, String careWay, String species, String orderBy) {
        this.closeFilter = closeFilter;
        this.sdate = sdate;
        this.edate = edate;
        this.location = location;
        this.careWay = careWay;
        this.species = species;
        this.orderBy = orderBy;
    }

    public Boolean getCloseFilter() {
        return closeFilter;
    }
    public void setCloseFilter(Boolean closeFilter) {
        this.closeFilter = closeFilter;
    }
    public LocalDateTime getSdate() {
        return sdate;
    }
    public void setSdate(LocalDateTime sdate) {
        this.sdate = sdate;
    }
    public LocalDateTime getEdate() {
        return edate;
    }
    public void setEdate(LocalDateTime edate) {
        this.edate = edate;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
    public String getCareWay() {
        return careWay;
    }
    public void setCareWay(String careWay) {
        this.careWay = careWay;
    }
    public String getSpecies() {
        return species;
    }
    public void setSpecies(String species) {
        this.species = species;
    }
    public String getOrderBy() {
        return orderBy;
    }
    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    @Override
    public String toString() {
        return "Condition{" +
                "closeFilter=" + closeFilter +
                ", sdate=" + sdate +
                ", edate=" + edate +
                ", location='" + location + '\'' +
                ", careWay='" + careWay + '\'' +
                ", species='" + species + '\'' +
                ", orderBy='" + orderBy + '\'' +
                '}';
    }
}