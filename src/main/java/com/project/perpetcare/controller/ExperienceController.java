package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Experience;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.service.ProfileService;
import com.project.perpetcare.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/experience")
public class ExperienceController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProfileService profileService;



    @PostMapping("/update")
    public String update(HttpSession session, Model model, Experience experience) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }
        try{
            List<Experience> lists= profileService.getSitterExperience(user.getEmail());

            return null;
        }catch(Exception e){
            model.addAttribute("status", 500);
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "Error";
        }
    }
}
