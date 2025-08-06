package com.project.perpetcare.controller;

import com.project.perpetcare.service.ApplyService;
import com.project.perpetcare.service.OpeningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApplyController {

    @Autowired
    private ApplyService applyService;

    @GetMapping("/apply")
    public String createForm() {
        return "openingPage/opening-apply"; // JSP 경로
    }

}
