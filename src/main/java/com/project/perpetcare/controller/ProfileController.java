package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Experience;
import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.RateType;
import com.project.perpetcare.service.AuthService;
import com.project.perpetcare.service.PetService;
import com.project.perpetcare.service.ProfileService;
import com.project.perpetcare.service.RateService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class ProfileController {

    @Autowired
    private ProfileService profileService;
    @Autowired
    private RateService rateService;
    @Autowired
    private AuthService authService;
    @Autowired
    private PetService petService;

    @GetMapping("/experience")
    public String getProfile(HttpSession session, Model model,String email) {
        User user = (User) session.getAttribute("user");
        boolean isOwner = false;
        if(user == null) {
            return "redirect:/login";
        }
        User profile = null;
        try{
            if(email.equals(user.getEmail())){
                profile = user; //내거다 = isOwner false

            }else{
                profile = profileService.getUserInfo(email);
                System.out.println("profile :: "+profile);
                isOwner = true; //남의꺼 = isOwner true
            }
            model.addAttribute("isOwner", isOwner);
            model.addAttribute("profile", profile);
            // 시터 경험
            List<Experience> sitterList = profileService.getSitterExperience(profile.getEmail());
            session.setAttribute("sitterList", sitterList);
            // 돌봄 경험
            List<Experience> ownerList = profileService.getOwnerExperience(profile.getEmail());
            session.setAttribute("ownerList", ownerList);
            // 평가 개수
            int rateNum = rateService.getRateNum(profile.getEmail());
            session.setAttribute("rateNum", rateNum);
            // 부정 평가 비율
            if(rateNum != 0) {
                double nRatioOfRate = rateService.getNRatioOfRate(profile.getEmail());
                double negativeRatio = Math.round(nRatioOfRate*100)/100.0;
                double positiveRatio = 1 - negativeRatio;
                session.setAttribute("negativeRatio", negativeRatio);
                session.setAttribute("positiveRatio", positiveRatio);
                // 주요 평가 내용
                List<Map<String,Integer>> rateList = rateService.getUserTopRate(profile.getEmail());
                Map<String, Integer> textList = new LinkedHashMap<>();
                for(Map<String, Integer> m : rateList) {
                    for(Map.Entry<String, Integer> entry : m.entrySet()) {
                        String code = entry.getKey();
                        String text = RateType.getRate(code);
                        Integer count = entry.getValue();
                        textList.put(text, count);
                    }
                }
                session.setAttribute("rateList", textList);
            }
            return "profilePage/experiencePage";
        } catch (Exception e) {
            model.addAttribute("status", 500);
            return "Error";
        }

    }


    @GetMapping("/experiencePage")
    public String getProfile2(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }
        try{
            // 시터 경험
            List<Experience> sitterList = profileService.getSitterExperience(user.getEmail());
            session.setAttribute("sitterList", sitterList);
            // 돌봄 경험
            List<Experience> ownerList = profileService.getOwnerExperience(user.getEmail());
            session.setAttribute("ownerList", ownerList);
            // 평가 개수
            int rateNum = rateService.getRateNum(user.getEmail());
            session.setAttribute("rateNum", rateNum);
            // 부정 평가 비율
            if(rateNum != 0) {
                double nRatioOfRate = rateService.getNRatioOfRate(user.getEmail());
                double negativeRatio = Math.round(nRatioOfRate*100)/100.0;
                double positiveRatio = 1 - negativeRatio;
                session.setAttribute("negativeRatio", negativeRatio);
                session.setAttribute("positiveRatio", positiveRatio);
                // 주요 평가 내용
                List<Map<String,Integer>> rateList = rateService.getUserTopRate(user.getEmail());
                Map<String, Integer> textList = new LinkedHashMap<>();
                for(Map<String, Integer> m : rateList) {
                    for(Map.Entry<String, Integer> entry : m.entrySet()) {
                        String code = entry.getKey();
                        String text = RateType.getRate(code);
                        Integer count = entry.getValue();
                        textList.put(text, count);
                    }
                }
                session.setAttribute("rateList", textList);
            }
            return "profilePage/experiencePage";
        } catch (Exception e) {
            model.addAttribute("status", 500);
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "Error";
        }
    }

    @GetMapping("/myInfo")
    public String myInfo(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }
        return "profilePage/myInfo";
    }




    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/home.html";
    }






}
