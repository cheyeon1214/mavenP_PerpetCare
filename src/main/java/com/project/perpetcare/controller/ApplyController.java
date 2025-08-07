package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.Grade;
import com.project.perpetcare.service.ApplyService;
import com.project.perpetcare.service.OpeningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;

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

        return "openingPage/opening-apply";
    }

    @GetMapping("/applyList")
    public String getApplyList(Model model) {
        return "openingPage/apply-list"; // JSP 경로
    }

}
