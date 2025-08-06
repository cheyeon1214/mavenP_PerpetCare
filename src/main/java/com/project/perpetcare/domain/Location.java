package com.project.perpetcare.domain;

public class Location {
    private String lcode; // 컬럼명 동일
    private String address; // 컬럼명 동일

    public Location(){}
    public Location(String lcode, String address) {
        this.lcode = lcode;
        this.address = address;
    }

    public String getLcode() {
        return lcode;
    }
    public String getAddress() {
        return address;
    }

    @Override
    public String toString() {
        return "Location{" +
                "lcode='" + lcode + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}