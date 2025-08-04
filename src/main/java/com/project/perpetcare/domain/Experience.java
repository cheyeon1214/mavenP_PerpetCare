package com.project.perpetcare.domain;

import java.time.LocalDateTime;

public class Experience {
    private String uEmail; //u_email User의 외래키
    private String category; //e_category
    private LocalDateTime sDate; //e_sdate
    private LocalDateTime eDate; //e_edate
    private String species; //e_species
    private String breed; //e_breed

    public Experience(){}
    public Experience(String uEmail, String category, LocalDateTime sDate, LocalDateTime eDate, String species, String breed) {
        this.uEmail = uEmail;
        this.category = category;
        this.sDate = sDate;
        this.eDate = eDate;
        this.species = species;
        this.breed = breed;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
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

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    @Override
    public String toString() {
        return "Experience{" +
                "uEmail='" + uEmail + '\'' +
                ", category='" + category + '\'' +
                ", sDate=" + sDate +
                ", eDate=" + eDate +
                ", species='" + species + '\'' +
                ", breed='" + breed + '\'' +
                '}';
    }
}
