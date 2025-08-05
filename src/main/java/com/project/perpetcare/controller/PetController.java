package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.service.PetService;
import com.project.perpetcare.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/pet")
public class PetController {

    @Autowired
    private PetService petService;

    @GetMapping("/petPage")
    public String getPets(@RequestParam("uEmail") String uEmail, Model model) {
       // List<Pet> pets = petService.getPets(uEmail);
       // model.addAttribute("petList", pets);
        return "petPage";
    }

    @GetMapping("/registerForm")
    public String registerForm(){
        return "registerPet";
    }
}
