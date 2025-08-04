package com.project.perpetcare.controller;

import com.project.perpetcare.service.OpeningService;
import com.project.perpetcare.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class OpeningController {

    @Autowired
    private OpeningService openingService;

}
