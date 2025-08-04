package com.project.perpetcare.service;

import com.project.perpetcare.dao.PetDAO;
import com.project.perpetcare.dao.ProfileDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetService {

    @Autowired
    private PetDAO petDAO;

}
