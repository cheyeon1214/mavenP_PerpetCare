package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.service.PetService;

import java.io.File;
import java.util.Base64;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.UUID;

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

            for (Pet pet : pets) {
                if (pet.getImage() != null && pet.getImage().length > 0) {
                    String base64 = Base64.getEncoder().encodeToString(pet.getImage());
                    pet.setBase64Image(base64);
                }
            }
            msg = "getPets 호출";
            path= "profilePage/petPage";
        }catch(Exception e){
            msg="getPets 실패";
            System.out.println(e);
        }
        return new ModelAndView(path,"petList",pets);
    }
    //요청/petPage?uEmail=codus@naver.com
    //파라미터값 전달해주기

//    @PostMapping("/registerPet")
//    public ModelAndView registerPet(@ModelAttribute Pet pet) {
//        String msg = "";
//        String path = "redirect:/Error.jsp";
//        //에러페이지 만들까..
//        try {
//            if (pet.getImageFile() != null && !pet.getImageFile().isEmpty()) {
//                pet.setImage(pet.getImageFile().getBytes());
//            }
//            petService.insertPet(pet);
//
//            msg = "insertPet 호출";
//            path = "redirect:/petPage?uEmail=codus@naver.com";// + pet.getuEmail(); 세션넣으면 수정!!!!!!!!
//        }catch(Exception e){
//            msg="insertPet 실패";
//            System.out.println(e);
//        }
//        return new ModelAndView(path);
//    }
@PostMapping("/registerPet")
public ModelAndView registerPet(Pet pet, @RequestParam("imageFile") MultipartFile imageFile) {
    try {
        if (!imageFile.isEmpty()) {
            pet.setImage(imageFile.getBytes()); // MultipartFile → byte[]
        }
        petService.insertPet(pet); // pet.image (byte[]) 저장
        return new ModelAndView("redirect:/petPage?uEmail=codus@naver.com");
    } catch (Exception e) {
        e.printStackTrace();
        return new ModelAndView("redirect:/Error.jsp");
    }
}


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
    // 펫 삭제
    @GetMapping("/deletePet")
    public ModelAndView deletePet(@RequestParam("uEmail") String uEmail,@RequestParam("no") int no) {
        String path="redirect:/Error.jsp";
        String msg="";
        try{
            petService.deletePet(no);
            msg="deletePet 요청";
            path="redirect:/petPage?uEmail="+uEmail;

        }catch (Exception e){
            msg="deletePet 실패";
            System.out.println(e);
        }
        return new ModelAndView(path);
    }
}