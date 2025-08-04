package com.project.perpetcare.service;

import com.project.perpetcare.dao.ProfileDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    AuthService authService;

    @Autowired
    PetService petService;

    @Autowired
    ProfileDAO profileDAO;

    public UserService(AuthService authService, PetService petService, ProfileDAO profileDAO) {
        this.authService = authService;
        this.petService = petService;
        this.profileDAO = profileDAO;
    }
}
