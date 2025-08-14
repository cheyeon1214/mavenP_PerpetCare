package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Location;
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

    @GetMapping("/location")
    public List<Location> searchByLoc(@RequestParam String word) {
        try {
            return searchService.searchLoc(word);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @PostMapping("/filter")
    public List<Opening> searchByFilter(@RequestBody Condition condition) {
        // System.out.println("필터 조건 : "+condition);
        try{
            List<Opening> openings = searchService.searchOpenings(condition);
            for(Opening opening : openings){
                String[] adds = searchService.searchAddr(opening.getLocation()).split(",");
                String dong = adds[adds.length-1].trim();
                opening.setLocation(dong); // 코드 -> 주소명
                petService.encodePetImages(opening.getPets()); // 이미지 인코딩
                // System.out.println("controller test : "+opening);
            }
            return openings;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
