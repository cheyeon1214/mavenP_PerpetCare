package com.project.perpetcare.controller;

import com.project.perpetcare.dao.ProfileDAO;
import com.project.perpetcare.service.AuthService;
import com.project.perpetcare.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {

    @Autowired
    private ProfileService profileService;
    @Autowired
    private ProfileDAO profileDAO;

    @GetMapping("/experiencePage")
    public String getProfile(){
        return "profilePage/experiencePage";
    }


}
