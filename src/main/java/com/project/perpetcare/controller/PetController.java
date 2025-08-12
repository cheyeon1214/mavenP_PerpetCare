package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.service.PetService;

import java.util.Base64;
import java.util.List;

import com.project.perpetcare.service.ProfileService;
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

    @Autowired
    private ProfileService profileService;

    @GetMapping("/pet/getOne")
    public Pet getOnePet(@RequestParam("no") int no) {
        try {
            return petService.getPet(no);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/pet")
    public ModelAndView petPage(@RequestParam("email") String owner, HttpSession session, Model model) {
        String path = "redirect:/Error.jsp";
        String msg = "getPets 실패";
        List<Pet> pets = null;
        User profile = null;
        boolean isOwner = false;
        try {
            User user = (User) session.getAttribute("user");
            if(owner.equals(user.getEmail())){
                profile = user; //내거다 = isOwner false
            }else{
                profile = profileService.getUserInfo(owner);
                System.out.println("profile :: "+profile);
                isOwner = true; //남의꺼 = isOwner true
            }
            model.addAttribute("isOwner", isOwner);
            model.addAttribute("profile", profile);
            pets = petService.getPets(profile.getEmail());
            petService.encodePetImages(pets);
            path = "profilePage/myPet";
            msg = "getPets 성공";
        } catch (Exception e) {
            System.out.println(e);
        }
        return new ModelAndView(path, "pets", pets);
    }

    //펫 등록 + 이미지
    @PostMapping("/registerPet")
    public ModelAndView registerPet(Pet pet, @RequestParam("imageFile") MultipartFile imageFile,HttpSession session) {
        String path="Error";
        try {
            User user = (User) session.getAttribute("user");
            if (user == null || user.getEmail() == null) {
                return new ModelAndView("redirect:/login");
            }
            pet.setuEmail(user.getEmail());
            if ((imageFile != null) && !imageFile.isEmpty()) {
                pet.setImage(imageFile.getBytes()); // MultipartFile → byte[]
            }
            System.out.println("pet register: "+pet);
            petService.insertPet(pet); // pet.image (byte[]) 저장
            path = "redirect:/pet?email="+user.getEmail();
        } catch (Exception e) {
            return new ModelAndView(path, "message", "등록 중에 오류가 발생했습니다.");
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
            }else{
                Pet prePet = petService.getPet(pet.getNo());
                pet.setImage(prePet.getImage());
            }
            System.out.println("pet update: "+pet);
            User user = (User) session.getAttribute("user");
            String uEmail = user.getEmail();
            pet.setuEmail(uEmail);
            petService.updatePet(pet);
            msg = "updatePet 호출";
            path = "redirect:/pet?email="+uEmail;
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
}