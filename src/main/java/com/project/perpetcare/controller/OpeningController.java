package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.Grade;
import com.project.perpetcare.service.OpeningService;
import com.project.perpetcare.service.PetService;
import com.project.perpetcare.service.ProfileService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class OpeningController {

    @Autowired
    private OpeningService openingService;

    @Autowired
    private ProfileService profileService;

    @Autowired
    private PetService petService;

    @GetMapping("/openingDetail")
    public String getOpening(int no, Model model){
        try{
            Opening opening = openingService.getOpening(no);
            model.addAttribute("opening", opening);
            User user = profileService.getUserInfo(opening.getuEmail());
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            model.addAttribute("sDateStr", opening.getsDate().format(formatter));
            model.addAttribute("eDateStr", opening.geteDate().format(formatter));
            model.addAttribute("user", user);
            return "openingPage/opening-view";
        }catch (Exception e){
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "redirect:/Error.jsp";
        }

    }

    @GetMapping("/openingCreate")
    public String getCreateOpening(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        try {
            model.addAttribute("user", user);
            model.addAttribute("pets", petService.getPets(user.getEmail()));
            return "openingPage/opening-create";
        } catch (Exception e) {
            model.addAttribute("status", 500);
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "redirect:/Error.jsp";
        }
    }

    @PostMapping("/openingCreate")
    public String doCreateOpening(Opening opening, String petIds, Model model){
        try{
            opening.setCreatedAt(LocalDateTime.now());
            openingService.addOpening(opening);
            int openingNo = opening.getNo(); //opening 만들자마자 PK 가져옴
            List<Integer> petIdList = Arrays.stream(petIds.split(","))
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());

            for (int pNo : petIdList) {
                openingService.addPostPet(openingNo, pNo);
            }

            return "redirect:/opening/view?no=" + openingNo;
        } catch (Exception e) {
            model.addAttribute("status", 500);
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "redirect:/Error.jsp";
        }


    }


}
