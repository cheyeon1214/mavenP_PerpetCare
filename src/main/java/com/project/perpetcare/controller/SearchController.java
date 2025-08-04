package com.project.perpetcare.controller;

import com.project.perpetcare.service.OpeningService;
import com.project.perpetcare.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

}
