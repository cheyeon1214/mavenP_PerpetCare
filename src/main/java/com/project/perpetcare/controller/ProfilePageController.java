package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Experience;
import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.ApplyStatus;
import com.project.perpetcare.domain.enums.RateType;
import com.project.perpetcare.dto.ApplyUserDTO;
import com.project.perpetcare.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
public class ProfilePageController {

    @Autowired
    private ProfileService profileService;
    @Autowired
    private RateService rateService;
    @Autowired
    private ApplyService applyService;
    @Autowired
    private PetService petService;
    @Autowired
    private OpeningService openingService;

    @GetMapping("/pet")
    public ModelAndView petPage(@RequestParam("email") String owner, HttpSession session, Model model) {
        String path = "Error";
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
            return new ModelAndView(path, "message", "페이지를 불러오는 도중 문제가 발생했습니다.");
        }
        return new ModelAndView(path, "pets", pets);
    }

    @GetMapping("/experience")
    public String getProfile(HttpSession session, Model model,String email) {
        User user = (User) session.getAttribute("user");
        boolean isOwner = false;
        if(user == null) {
            return "redirect:/login";
        }
        User profile = null;
        try{
            if(email.equals(user.getEmail())){
                profile = user; //내거다 = isOwner false

            }else{
                profile = profileService.getUserInfo(email);
                System.out.println("profile :: "+profile);
                isOwner = true; //남의꺼 = isOwner true
            }
            model.addAttribute("isOwner", isOwner);
            model.addAttribute("profile", profile);
            // 시터 경험
            List<Experience> sitterList = profileService.getSitterExperience(profile.getEmail());
            session.setAttribute("sitterList", sitterList);
            // 돌봄 경험
            List<Experience> ownerList = profileService.getOwnerExperience(profile.getEmail());
            session.setAttribute("ownerList", ownerList);
            // 평가 개수
            int rateNum = rateService.getRateNum(profile.getEmail());
            session.setAttribute("rateNum", rateNum);
            double negativeRatio = 0.0;
            double positiveRatio = 0.0;

            Map<String, Integer> textList = new LinkedHashMap<>();
            // 부정 평가 비율
            if(rateNum != 0) {
                double nRatioOfRate = rateService.getNRatioOfRate(profile.getEmail());
                negativeRatio = Math.round(nRatioOfRate*100)/100.0;
                positiveRatio = 1 - negativeRatio;
                // 주요 평가 내용
                List<Map<String,Integer>> rateList = rateService.getUserTopRate(profile.getEmail());
                System.out.println("rateList :: "+rateList.size());
                for(Map<String, Integer> m : rateList) {
                    for(Map.Entry<String, Integer> entry : m.entrySet()) {
                        String code = entry.getKey();
                        String text = RateType.getRate(code);
                        Integer count = entry.getValue();
                        textList.put(text, count);
                    }
                }
            }
            model.addAttribute("rateList", textList);
            model.addAttribute("negativeRatio", negativeRatio);
            model.addAttribute("positiveRatio", positiveRatio);
            return "profilePage/experience";
        } catch (Exception e) {
            model.addAttribute("message", "페이지를 불러오는 도중 문제가 발생했습니다.");
            return "Error";
        }
    }

    @GetMapping("/my-opening")
    public String getMyOpening(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        try {
            List<Opening> openings = openingService.getUserOpening(user.getEmail());

            List<Opening> ongoing = new ArrayList<>();
            List<Opening> closed  = new ArrayList<>();
            List<Opening> matched = new ArrayList<>();
            Map<Integer, Boolean> isRatedMap = new HashMap<>();

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
                        boolean rated = rateService.hasRated(user.getEmail(), op.getNo());
                        isRatedMap.put(op.getNo(), rated);
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
            model.addAttribute("isRatedMap", isRatedMap);

            return "profilePage/my-opening";
        } catch (Exception e) {
            model.addAttribute("message","공고 정보를 불러오는 도중 문제가 발생했습니다.");
            return "Error";
        }
    }

    @GetMapping("/apply-opening")
    public String getMyApplyOpening(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        try{
            List<ApplyUserDTO> myApplyList = applyService.getApplyList(user.getEmail());
            for(ApplyUserDTO myApply : myApplyList){
                System.out.println(myApply);
            }
            List<Opening> accept = new ArrayList<>();
            List<Opening> reject  = new ArrayList<>();
            List<Opening> pending = new ArrayList<>();
            Map<Integer, Pet> firstPets = new HashMap<>();
            Map<Integer, User> userProfile = new HashMap<>();
            Map<Integer, Boolean> isRatedMap = new HashMap<>();
            DateTimeFormatter F = DateTimeFormatter.ofPattern("yyyy.MM.dd");

            for(ApplyUserDTO myApply : myApplyList){
                Opening op = openingService.getOpening(myApply.getoNo());
                if (op == null) {
                    System.err.println("[myApply] Opening not found or filtered by join. oNo=" + myApply.getoNo()
                            + ", aNo=" + myApply.getaNo() + ", status=" + myApply.getaStatus());
                    continue; // 일단 건너뛴다
                }

                // 날짜 문자열 세팅 (null 세이프)
                if (op.getsDate() != null) op.setsDateStr(op.getsDate().toLocalDate().format(F));
                if (op.geteDate() != null) op.seteDateStr(op.geteDate().toLocalDate().format(F));
                List<Pet> pets = op.getPets();
                if (pets != null && !pets.isEmpty()) {
                    petService.encodePetImages(pets);
                    firstPets.put(op.getNo(), pets.get(0));
                }
                if(myApply.getaStatus().equals(ApplyStatus.accept.name())){
                    accept.add(op);
                    User profile = profileService.getUserInfo(op.getuEmail());
                    userProfile.put(op.getNo(),  profile);
                    boolean rated = rateService.hasRated(user.getEmail(), op.getNo());
                    isRatedMap.put(op.getNo(), rated);
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
            model.addAttribute("isRatedMap", isRatedMap);
            return "profilePage/apply-opening";
        } catch (Exception e) {
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", "공고 정보를 불러오는 도중 문제가 발생했습니다.");
            return "Error";
        }

    }

    @GetMapping("/recent-opening")
    public String getRecentOpening(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        model.addAttribute("user", user);
        return "profilePage/recent-opening";
    }

    @GetMapping("/myInfo")
    public String updateInfo(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }
        return "profilePage/edit-profile";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/home.html";
    }
}
