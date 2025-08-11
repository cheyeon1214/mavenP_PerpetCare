package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.service.PetService;

import java.util.Base64;
import java.util.List;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
//@RequestMapping("/pet")
public class PetController {

    @Autowired
    private PetService petService;

    @GetMapping("/petPage")
    public ModelAndView getPets(HttpSession session){
        String path="redirect:/Error.jsp";
        String msg = "";
        List<Pet> pets = null;
        try {
            User user = (User) session.getAttribute("user");
            String uEmail = user.getEmail();
            session.setAttribute("uEmail", uEmail);
            pets = petService.getPets(uEmail);
            petService.encodePetImages(pets);

            msg = "getPets 호출";
            path= "profilePage/petPage2";
        }catch(Exception e){
            msg="getPets 실패";
            System.out.println(e);
        }
        return new ModelAndView(path,"petList",pets);
    }
    //요청/petPage?uEmail=codus@naver.com
    //파라미터값 전달해주기

    //펫 등록 + 이미지
    @PostMapping("/registerPet")
    public ModelAndView registerPet(Pet pet, @RequestParam("imageFile") MultipartFile imageFile,HttpSession session) {
        String path="redirect:/Error.jsp";
        String msg="";

        try {

            if (!imageFile.isEmpty()) {
                pet.setImage(imageFile.getBytes()); // MultipartFile → byte[]
            }
            User user = (User) session.getAttribute("user");
            String uEmail = user.getEmail();
            pet.setuEmail(uEmail);
            petService.insertPet(pet); // pet.image (byte[]) 저장
            msg="insertPet 호출";
            path = "redirect:/petPage";
        } catch (Exception e) {
            msg="insertPet 실패";
            System.out.println(e);
        }
        return new ModelAndView(path);
    }


    // 펫 수정
    @PostMapping("/updatePet")
    public ModelAndView updatePet(@ModelAttribute Pet pet,@RequestParam("imageFile") MultipartFile imageFile,HttpSession session) {
        String path="redirect:/Error.jsp";
        String msg="";

        try {
            if (!imageFile.isEmpty()) {
                pet.setImage(imageFile.getBytes()); // MultipartFile → byte[]
            }
            User user = (User) session.getAttribute("user");
            String uEmail = user.getEmail();
            pet.setuEmail(uEmail);
            petService.updatePet(pet);
            msg = "updatePet 호출";
            path = "redirect:/petPage";
        }catch (Exception e){
            msg = "updatePet 실패";
            System.out.println(e);
        }
        return new ModelAndView(path);
    }

    // 펫 삭제
    @GetMapping("/deletePet")
    public ModelAndView deletePet(@RequestParam("no") int no,HttpSession session) {
        String path="redirect:/Error.jsp";
        String msg="";
        try{
            User user = (User) session.getAttribute("user");
            String uEmail = user.getEmail();
            petService.deletePet(no);
            msg="deletePet 요청";
            path="redirect:/petPage";

        }catch (Exception e){
            msg="deletePet 실패";
            System.out.println(e);
        }
        return new ModelAndView(path);
    }

    //태란이 펫페이지로 이동
    @GetMapping("/petPage2")
    public String getPets2(Model model, HttpSession session){

        List<Pet> pets = null;
        try {
            User user = (User) session.getAttribute("user");
            String uEmail = user.getEmail();
            session.setAttribute("uEmail", uEmail);
            pets = petService.getPets(uEmail);
            petService.encodePetImages(pets);

        }catch(Exception e){
            return "Error";
        }
        return "profilePage/petPage2";
    }
}