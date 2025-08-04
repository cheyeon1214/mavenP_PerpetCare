package com.project.perpetcare.controller;

import com.project.perpetcare.service.PetService;
import com.project.perpetcare.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PetController {

    @Autowired
    private PetService petService;

}
