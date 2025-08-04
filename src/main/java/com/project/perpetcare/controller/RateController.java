package com.project.perpetcare.controller;

import com.project.perpetcare.service.ApplyService;
import com.project.perpetcare.service.RateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class RateController {

    @Autowired
    private RateService rateService;

}
