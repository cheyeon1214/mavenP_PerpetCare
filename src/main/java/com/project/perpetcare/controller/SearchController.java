package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.dto.Condition;
import com.project.perpetcare.service.PetService;
import com.project.perpetcare.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/api/search")
public class SearchController {

    @Autowired
    private SearchService searchService;

    @Autowired
    PetService petService;

//    @PostMapping("/filter")
//    public String searchOpenings(@RequestBody Condition condition, Model model) throws Exception {
//        System.out.println("Controller 도착 확인");
//        List<Opening> openings = searchService.searchOpenings(condition);
//        model.addAttribute("openings", openings);
//        return "search.jsp";
//    }

    @PostMapping("/filter")
    public List<Opening> searchOpenings(@RequestBody Condition condition) {
        System.out.println("필터 조건 : "+condition);
        try{
            List<Opening> openings = searchService.searchOpenings(condition);
            ArrayList<Pet> pets = null;
            for(Opening opening : openings){
                pets = opening.getPets();
                petService.encodePetImages(pets);
            }

            return openings;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
