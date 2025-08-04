package com.project.perpetcare.controller;

import com.project.perpetcare.service.AuthService;
import com.project.perpetcare.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ProfileController {

    @Autowired
    private ProfileService profileService;

}
