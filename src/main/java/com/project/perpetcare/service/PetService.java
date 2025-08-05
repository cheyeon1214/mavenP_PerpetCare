package com.project.perpetcare.service;

import com.project.perpetcare.dao.PetDAO;
import com.project.perpetcare.dao.ProfileDAO;
import com.project.perpetcare.domain.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public List<Pet> selectPet(String uEmail)throws Exception{
        return petDAO.selectPet(uEmail);
    }
}
