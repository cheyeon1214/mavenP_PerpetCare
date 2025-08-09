package com.project.perpetcare.controller;

import com.project.perpetcare.dao.ProfileDAO;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.service.AuthService;
import com.project.perpetcare.service.ProfileService;
import jakarta.servlet.http.HttpSession;
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

    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        try{
            User user = (User) session.getAttribute("user");
            if(user == null) {
                return "redirect:/login";
            }
            model.addAttribute("user", user);
            return "profilePage/petPage";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error";
        }

    }

    @GetMapping("/experiencePage")
    public String getProfile(){
        return "profilePage/experiencePage";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/home.html";
    }






}
