package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.ApplyStatus;
import com.project.perpetcare.domain.enums.Grade;
import com.project.perpetcare.dto.ApplyUserDTO;
import com.project.perpetcare.service.ApplyService;
import com.project.perpetcare.service.OpeningService;
import com.project.perpetcare.service.PetService;
import com.project.perpetcare.service.ProfileService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/opening")
public class OpeningController {

    @Autowired
    private OpeningService openingService;

    @Autowired
    private ProfileService profileService;

    @Autowired
    private ApplyService applyService;

    @Autowired
    private PetService petService;

    @GetMapping("/detail")
    public String getOpening(int no, Model model){
        try{
            Opening opening = openingService.getOpening(no);
            List<Pet> pets = opening.getPets();
            petService.encodePetImages(pets);
            model.addAttribute("opening", opening);
            User user = profileService.getUserInfo(opening.getuEmail());
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            model.addAttribute("sDateStr", opening.getsDate().format(formatter));
            model.addAttribute("eDateStr", opening.geteDate().format(formatter));
            model.addAttribute("user", user);
            return "openingPage/opening-view";
        }catch (Exception e){
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "Error";
        }

    }

    @GetMapping("/create")
    public String getCreateOpening(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        try {
            model.addAttribute("user", user);
            List<Pet> pets = petService.getPets(user.getEmail());
            petService.encodePetImages(pets);
            model.addAttribute("pets", pets);
            return "openingPage/opening-create";
        } catch (Exception e) {
            model.addAttribute("status", 500);
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "Error";
        }
    }

    @PostMapping("/create")
    public String doCreateOpening(Opening opening, String petIds, Model model){
        try{
            opening.setCreatedAt(LocalDateTime.now());
//            opening.setLocation("1111016900");
            openingService.addOpening(opening);
            int openingNo = opening.getNo(); //opening 만들자마자 PK 가져옴
            List<Integer> petIdList = Arrays.stream(petIds.split(","))
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());

            for (int pNo : petIdList) {
                openingService.addPostPet(openingNo, pNo);
            }

            return "redirect:/opening/detail?no=" + openingNo;
        } catch (Exception e) {
            model.addAttribute("status", 500);
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "Error";
        }
    }

    @GetMapping("/mine")
    public String getMyOpening(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        try {
            List<Opening> openings = openingService.getUserOpening(user.getEmail());

            List<Opening> ongoing = new ArrayList<>();
            List<Opening> closed  = new ArrayList<>();
            List<Opening> matched = new ArrayList<>();

            Map<Integer, Pet> firstPets = new HashMap<>();
            Map<Integer, ApplyUserDTO> acceptedByOpening = new HashMap<>();

            DateTimeFormatter F = DateTimeFormatter.ofPattern("yyyy.MM.dd");
            for (Opening op : openings) {
                List<Pet> pets = op.getPets();
                op.setsDateStr(op.getsDate() != null ? op.getsDate().toLocalDate().format(F) : "");
                op.seteDateStr(op.geteDate() != null ? op.geteDate().toLocalDate().format(F) : "");
                if (pets != null && !pets.isEmpty()) {
                    petService.encodePetImages(pets);
                    firstPets.put(op.getNo(), pets.get(0));
                }

                if (op.getIsMatch()) {
                    matched.add(op);

                    List<ApplyUserDTO> applicants = applyService.getApplicants(op.getNo());
                    if (applicants != null) {
                        ApplyUserDTO accepted = applicants.stream()
                                .filter(a -> ApplyStatus.accept.name().equals(a.getaStatus()))
                                .findFirst().orElse(null);
                        if (accepted != null) acceptedByOpening.put(op.getNo(), accepted);
                    }
                } else if (op.isClose()) {
                    closed.add(op);
                } else {
                    ongoing.add(op);
                }
            }
            model.addAttribute("user", user);
            model.addAttribute("ongoing", ongoing);
            model.addAttribute("closed",  closed);
            model.addAttribute("matched", matched);
            model.addAttribute("firstPets", firstPets);
            model.addAttribute("acceptedByOpening", acceptedByOpening);

            return "profilePage/myOpening";
        } catch (Exception e) {
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "Error";
        }
    }

    @PostMapping("/update")
    public String updateOpening(Opening opening, Model model) {
        try{
            System.out.println(opening);
            openingService.updateOpening(opening);  // careWay, location, prefer 등 업데이트

            return "redirect:/opening/mine";
        }catch (Exception e){
            return "Error";
        }

    }

    @GetMapping("/myApply")
    public String getMyApplyOpening(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        try{
            List<ApplyUserDTO> myApplyList = applyService.getApplyList(user.getEmail());
            List<Opening> accept = new ArrayList<>();
            List<Opening> reject  = new ArrayList<>();
            List<Opening> pending = new ArrayList<>();
            Map<Integer, Pet> firstPets = new HashMap<>();
            Map<Integer, User> userProfile = new HashMap<>();
            DateTimeFormatter F = DateTimeFormatter.ofPattern("yyyy.MM.dd");

            for(ApplyUserDTO myApply : myApplyList){
                Opening op = openingService.getOpening(myApply.getoNo());
                op.setsDateStr(op.getsDate() != null ? op.getsDate().toLocalDate().format(F) : "");
                op.seteDateStr(op.geteDate() != null ? op.geteDate().toLocalDate().format(F) : "");
                List<Pet> pets = op.getPets();
                if (pets != null && !pets.isEmpty()) {
                    petService.encodePetImages(pets);
                    firstPets.put(op.getNo(), pets.get(0));
                }
                if(myApply.getaStatus().equals(ApplyStatus.accept.name())){
                    accept.add(op);
                    User profile = profileService.getUserInfo(op.getuEmail());
                    userProfile.put(op.getNo(),  profile);
                }else if(myApply.getaStatus().equals(ApplyStatus.reject.name())){
                    reject.add(op);
                }else if(myApply.getaStatus().equals(ApplyStatus.pending.name())){
                    pending.add(op);
                }
            }

            model.addAttribute("user", user);
            model.addAttribute("accept", accept);
            model.addAttribute("reject", reject);
            model.addAttribute("pending", pending);
            model.addAttribute("firstPets", firstPets);
            model.addAttribute("userProfile", userProfile);
            return "profilePage/applyOpening";
        } catch (Exception e) {
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "Error";
        }

    }

    @GetMapping("/recent")
    public String getRecentOpening(Model model, HttpSession session){
        return "profilePage/recentOpening";
    }
}
