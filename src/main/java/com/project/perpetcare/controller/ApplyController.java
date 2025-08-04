package com.project.perpetcare.controller;

import com.project.perpetcare.service.ApplyService;
import com.project.perpetcare.service.OpeningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ApplyController {

    @Autowired
    private ApplyService applyService;

}
