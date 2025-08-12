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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
//@RequestMapping("/pet")
public class PetController {

    @Autowired
    private PetService petService;

    @GetMapping("/pet/getOne")
    public Pet getOnePet(@RequestParam("no") int no) {
        try {
            return petService.getPet(no);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/pet")
    public ModelAndView petPage(@RequestParam("uEmail") String owner, HttpSession session, Model model) {
        String path = "redirect:/Error.jsp";
        String msg = "getPets 실패";
        List<Pet> pets = null;
        try {
            User user = (User) session.getAttribute("user");
            boolean isOwner = (user != null) && user.getEmail().equals(owner);
            model.addAttribute("isOwner", isOwner);
            pets = petService.getPets(owner);
            path = "profilePage/myPet";
            msg = "getPets 성공";
        } catch (Exception e) {
            System.out.println(e);
        }
        return new ModelAndView(path, "pets", pets);
    }

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
            path= "profilePage/petPage";
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
    @PostMapping("/deletePet")
    @ResponseBody
    public String deletePet(int no) {
        String path="redirect:/Error.jsp";
        try{
            petService.deletePet(no);
            return "ok";
        }catch (Exception e){
            return "error";
        }
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