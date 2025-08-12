package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Rate;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.service.ApplyService;
import com.project.perpetcare.service.RateService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.project.perpetcare.domain.enums.RateType;

import java.time.LocalDateTime;

@Controller
public class RateController {

    @Autowired
    private RateService rateService;

    @PostMapping("/rate/add")
    @ResponseBody
    public String addRate(@RequestParam int oNo,
                          @RequestParam String toEmail,
                          @RequestParam String code,
                          HttpSession session){
        try{
            System.out.println("oNo:"+oNo);
            System.out.println("toEmail:"+toEmail);
            System.out.println("code:"+code);
            String from = ((User)session.getAttribute("user")).getEmail();
            rateService.addUserRate(new Rate(0, from, toEmail, oNo, code, LocalDateTime.now()));
        }catch (Exception e){
            e.printStackTrace();
        }

        return "ok";
    }

}
