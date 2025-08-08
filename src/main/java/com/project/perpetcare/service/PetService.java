package com.project.perpetcare.service;

import com.project.perpetcare.dao.PetDAO;
import com.project.perpetcare.dao.ProfileDAO;
import com.project.perpetcare.domain.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Base64;
import java.util.List;

@Service
public class PetService {

    @Autowired
    private PetDAO petDAO;

    public void insertPet(Pet pet)throws Exception{
        petDAO.insertPet(pet);
    }
    public void updatePet(Pet pet)throws Exception{
        petDAO.updatePet(pet);
    }
    public void deletePet(int no)throws Exception{
        petDAO.deletePet(no);
    }
    public List<Pet> getPets(String uEmail)throws Exception{
        return petDAO.getPets(uEmail);
    }
    public void encodePetImages(List<Pet> pets) {
        if (pets != null) {
            for (Pet pet : pets) {
                if (pet.getImage() != null && pet.getImage().length > 0) {
                    String base64 = Base64.getEncoder().encodeToString(pet.getImage());
                    pet.setBase64Image(base64);
                }
            }
        }
    }
}
