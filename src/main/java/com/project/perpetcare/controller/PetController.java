package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.service.PetService;
import com.project.perpetcare.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
//@RequestMapping("/pet")
public class PetController {

    @Autowired
    private PetService petService;

    @GetMapping("/petPage")
    public ModelAndView getPets(@RequestParam("uEmail") String uEmail){
       String path="";
       String msg = "";
       List<Pet> pets = null;
        try {
            pets = petService.getPets(uEmail);
            msg = "getPets 호출";
            path= "petPage";
        }catch(Exception e){
            e.printStackTrace();
        }
        return new ModelAndView(path,"petList",pets);
    }
    //요청/petPage?uEmail=codus@naver.com
    //파라미터값 전달해주기

    @GetMapping("/registerForm")
    public String registerForm(){
        return "registerPet";
    }
//    // 펫 등록
//    @PostMapping("/register")
//    public String registerPet(Pet pet) {
//        petService.insertPet(pet);
//        return "redirect:/pet/list?email=" + pet.getUEmail();  // 등록 후 목록으로 리다이렉트
//    }
//
//    // 펫 수정 폼 이동
//    @GetMapping("/editForm")
//    public String editForm(@RequestParam("no") int no, Model model) {
//        Pet pet = petService.getPetByNo(no);
//        model.addAttribute("pet", pet);
//        return "pet/editPet";  // /WEB-INF/views/pet/editPet.jsp
//    }
//
//    // 펫 수정
//    @PostMapping("/edit")
//    public String editPet(Pet pet) {
//        petService.updatePet(pet);
//        return "redirect:/pet/list?email=" + pet.getUEmail();  // 수정 후 목록으로 리다이렉트
//    }
//
//    // 펫 삭제
//    @GetMapping("/delete")
//    public String deletePet(@RequestParam("no") int no, @RequestParam("email") String email) {
//        petService.deletePet(no);
//        return "redirect:/pet/list?email=" + email;
//    }
}
