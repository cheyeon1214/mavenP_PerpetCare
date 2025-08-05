package com.project.perpetcare.controller;

import com.project.perpetcare.service.OpeningService;
import com.project.perpetcare.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/opening")
public class OpeningController {

    @Autowired
    private OpeningService openingService;

    @GetMapping("/create")
    public String createForm() {
        return "openingPage/opening-create"; // JSP 경로
    }

}
