package com.project.perpetcare.dto;

import java.time.LocalDate;

public class Condition {
    private Boolean closeFilter; // 컬럼명 o_close
    private LocalDate sdate; // 컬럼명 o_sdate
    private LocalDate edate; // 컬럼명 o_edate
    private String location; // 컬럼명 o_location
    private String careWay; // 컬럼명 o_careway
    private String species; // Opening -> Pet -> species 를 가져온다
    private String orderBy; // recent 또는 old

    public Condition() {
    }
    public Condition(Boolean closeFilter, LocalDate sdate, LocalDate edate,
                     String location, String careWay, String species, String orderBy) {
        this.closeFilter = closeFilter;
        this.sdate = sdate;
        this.edate = edate;
        this.location = location;
        this.careWay = careWay;
        this.species = species;
        this.orderBy = orderBy;
    }

    public Boolean getCloseFilter() { return closeFilter; }
    public void setCloseFilter(Boolean closeFilter) {
        this.closeFilter = closeFilter;
    }
    public LocalDate getSdate() {
        return sdate;
    }
    public void setSdate(LocalDate sdate) {
        this.sdate = sdate;
    }
    public LocalDate getEdate() {
        return edate;
    }
    public void setEdate(LocalDate edate) {
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