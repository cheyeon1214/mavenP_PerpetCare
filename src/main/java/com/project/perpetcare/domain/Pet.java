package com.project.perpetcare.domain;

import java.sql.Blob;
import java.time.LocalDateTime;

public class Pet {
    private int no; //p_no
    private String uEmail; //u_email
    private String name; //p_name
    private String species; //p_species
    private String breed; //p_breed
    private LocalDateTime bDate; //p_bdate
    private String gender; //p_gender
    private Blob image; //p_image

    public Pet(){}
    public Pet(String uEmail, int no, String name, String species, String breed, LocalDateTime bDate, String gender, Blob image) {
        this.uEmail = uEmail;
        this.no = no;
        this.name = name;
        this.species = species;
        this.breed = breed;
        this.bDate = bDate;
        this.gender = gender;
        this.image = image;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public LocalDateTime getbDate() {
        return bDate;
    }

    public void setbDate(LocalDateTime bDate) {
        this.bDate = bDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Pet{" +
                "no=" + no +
                ", uEmail='" + uEmail + '\'' +
                ", name='" + name + '\'' +
                ", species='" + species + '\'' +
                ", breed='" + breed + '\'' +
                ", bDate=" + bDate +
                ", gender='" + gender + '\'' +
                ", image=" + image +
                '}';
    }
}
