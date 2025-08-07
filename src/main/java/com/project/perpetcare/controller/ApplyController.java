package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Apply;
import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.Grade;
import com.project.perpetcare.service.ApplyService;
import com.project.perpetcare.service.OpeningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class ApplyController {
    User user =  new User("codus@naver.com", "곽채연", LocalDate.now(), "f",
            "1234", "01055821857", Grade.Silver,1);


    @Autowired
    private ApplyService applyService;

    @Autowired
    private OpeningService openingService;

    @GetMapping("/apply")
    public String getApply(int no, Model model) throws Exception {
        Opening opening = openingService.getOpening(no);
        model.addAttribute("opening", opening);
        model.addAttribute("user", user);
        model.addAttribute("firstPet", opening.getPets().get(0));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        model.addAttribute("sDateStr", opening.getsDate().format(formatter));
        model.addAttribute("eDateStr", opening.geteDate().format(formatter));
        return "openingPage/opening-apply";
    }

    @PostMapping("/apply")
    public String doApply(Apply apply, Model model) throws Exception {
        apply.setCreatedAt(LocalDateTime.now());
        applyService.applyToOpening(apply);

        return "openingPage/apply-list";
    }

    @GetMapping("/applyList")
    public String getApplyList(Model model) {
        return "openingPage/apply-list"; // JSP 경로
    }

}
