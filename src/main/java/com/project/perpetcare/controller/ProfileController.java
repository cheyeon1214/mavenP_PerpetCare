package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Experience;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.service.ProfileService;
import com.project.perpetcare.service.RateService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class ProfileController {

    @Autowired
    private ProfileService profileService;
    @Autowired
    private RateService rateService;

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
    public String getProfile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }
        try{
            List<Experience> sitterList = profileService.getSitterExperience(user.getEmail());
            List<Experience> ownerList = profileService.getOwnerExperience(user.getEmail());
            List<Map<String,Integer>> rateList = rateService.getUserTopRate(user.getEmail());
            session.setAttribute("sitterList", sitterList);
            session.setAttribute("ownerList", ownerList);
            session.setAttribute("rateList", rateList);
            return "profilePage/experiencePage";
        } catch (Exception e) {
            model.addAttribute("status", 500);
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "Error";
        }
    }




    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/home.html";
    }






}
