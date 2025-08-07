package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.service.OpeningService;
import com.project.perpetcare.service.PetService;
import com.project.perpetcare.service.ProfileService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;

@Controller
@RequestMapping("/opening")
public class OpeningController {

    @Autowired
    private OpeningService openingService;

    @Autowired
    private ProfileService profileService;

    @Autowired
    private PetService petService;

    @GetMapping("/view")
    public String getOpening(int no, Model model) throws Exception {
        Opening opening = openingService.getOpening(no);
        model.addAttribute("opening", opening);
        User user = profileService.getUserInfo(opening.getuEmail());
        // 연령대 계산
        int birthYear = user.getBdate().getYear();
        int age = LocalDate.now().getYear() - birthYear;
        String ageGroup = (age / 10) * 10 + "대";



        model.addAttribute("user", user);
        model.addAttribute("ageGroup", ageGroup);
        return "openingPage/opening-view";
    }

    @GetMapping("/create")
    public String createOpening(Model model) throws Exception {

        return "openingPage/opening-create";
    }

}
