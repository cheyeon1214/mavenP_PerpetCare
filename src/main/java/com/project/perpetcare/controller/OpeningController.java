package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.ApplyStatus;
import com.project.perpetcare.dto.ApplyUserDTO;
import com.project.perpetcare.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String getOpening(int no, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        try{
            Opening opening = openingService.getOpening(no);
            List<Pet> pets = opening.getPets();
            petService.encodePetImages(pets);
            model.addAttribute("opening", opening);
            User owner = profileService.getUserInfo(opening.getuEmail());
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            model.addAttribute("sDateStr", opening.getsDate().format(formatter));
            model.addAttribute("eDateStr", opening.geteDate().format(formatter));
            model.addAttribute("user", user);
            model.addAttribute("owner", owner);
            return "openingPage/opening-view";
        }catch (Exception e){
            model.addAttribute("message", "공고 정보를 불러오는 도중 문제가 발생했습니다.");
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
            model.addAttribute("message", "페이지를 불러오는 도중 문제가 발생했습니다.");
            return "Error";
        }
    }

    @PostMapping("/create")
    public String createOpening(Opening opening, String petIds, Model model){
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
            model.addAttribute("message", "공고를 게시하는 도중 문제가 발생했습니다.");
            return "Error";
        }
    }

    @PostMapping("/update")
    public String updateOpening(Opening opening, Model model) {
        try{
            int no = opening.getNo();
            String lcode = openingService.getOpeningOfLcode(no).getLocation();

            if(!opening.getLocation().startsWith("1") && !opening.getLocation().startsWith("2")) {
                opening.setLocation(lcode);
            }

            System.out.println("update opening : "+opening);
            openingService.updateOpening(opening);  // careWay, location, prefer 등 업데이트


            return "redirect:/opening/mine";
        }catch (Exception e){
            model.addAttribute("message", "공고를 수정하는 도중 문제가 발생했습니다.");
            return "Error";
        }

    }

    @GetMapping("/by-ids")
    @ResponseBody
    public List<Opening> getOpeningsByIds(@RequestParam("ids") List<Integer> ids) throws Exception {
        if (ids == null || ids.isEmpty()) {
            return Collections.emptyList();
        }
        List<Integer> safeIds = ids.stream()
                .filter(Objects::nonNull)
                .distinct()
                .limit(6)
                .toList();

        List<Opening> openings = new ArrayList<>();
        for (Integer id : safeIds) {
            Opening opening = openingService.getOpening(id);

            if (opening != null) {
                List<Pet> pets = opening.getPets();
                if (pets != null && !pets.isEmpty()) {
                    petService.encodePetImages(pets);
                }
                openings.add(opening);
            }
        }
        return openings;
    }

    @PostMapping("/end")
    @ResponseBody
    public String endOpening(@RequestParam int no) {
        try {
            openingService.closeOpening(no);
            applyService.rejectOthers(no);
            return "ok";
        } catch (Exception e) {
            return "fail: " + e.getMessage();
        }
    }

    @PostMapping("/delete")
    @ResponseBody
    public String deleteOpening(int no) {
        try {
            openingService.deleteOpening(no);
            return "ok";
        } catch (Exception e) {
            return "fail";
        }
    }
}
