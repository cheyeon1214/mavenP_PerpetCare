package com.project.perpetcare.domain;

import org.springframework.web.multipart.MultipartFile;

import java.sql.Blob;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Pet {
    private int no; //p_no
    private String uEmail; //u_email
    private String name; //p_name
    private String species; //p_species
    private String breed; //p_breed
    private LocalDate bDate; //p_bdate
    private String gender; //p_gender
    private byte[] image; //p_image

    private String base64Image;
    private MultipartFile imageFile;

    public MultipartFile getImageFile() {
        return imageFile;
    }

    public void setImageFile(MultipartFile imageFile) {
        this.imageFile = imageFile;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }



    public Pet(){}
    public Pet( int no, String uEmail, String name, String species, String breed, LocalDate bDate, String gender, byte[] image) {
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

    public LocalDate getbDate() {
        return bDate;
    }

    public void setbDate(LocalDate bDate) {
        this.bDate = bDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getAge(){
        return LocalDate.now().getYear() - bDate.getYear()+1 +"살";
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
