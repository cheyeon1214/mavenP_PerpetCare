package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Apply;
import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.ApplyStatus;
import com.project.perpetcare.domain.enums.Grade;
import com.project.perpetcare.dto.ApplyUserDTO;
import com.project.perpetcare.service.ApplyService;
import com.project.perpetcare.service.OpeningService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ApplyController {

    @Autowired
    private ApplyService applyService;

    @Autowired
    private OpeningService openingService;

    @GetMapping("/apply")
    public String getApply(int no, Model model, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        try {
            Opening opening = openingService.getOpening(no);
            model.addAttribute("opening", opening);
            model.addAttribute("user", session.getAttribute("user"));
            model.addAttribute("firstPet", opening.getPets().get(0));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            model.addAttribute("sDateStr", opening.getsDate().format(formatter));
            model.addAttribute("eDateStr", opening.geteDate().format(formatter));
            return "openingPage/opening-apply";
        } catch (Exception e) {
            model.addAttribute("status", 500);
            model.addAttribute("error", "Internal Server Error");
            model.addAttribute("message", e.getMessage());
            return "redirect:/Error.jsp";
        }
    }

    @PostMapping("/apply")
    public String doApply(Apply apply, Model model){
        try{
            apply.setCreatedAt(LocalDateTime.now());
            applyService.applyToOpening(apply);

            return "redirect:/applyList?no=" + apply.getoNo();
        }catch (Exception e){
            model.addAttribute("message", e.getMessage());
            return "redirect:/Error.jsp";
        }

    }

    @GetMapping("/applyList")
    public String getApplyList(int no,Model model){
        try{
            Opening opening = openingService.getOpening(no);
            model.addAttribute("opening", opening);
            model.addAttribute("firstPet", opening.getPets().get(0));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            model.addAttribute("sDateStr", opening.getsDate().format(formatter));
            model.addAttribute("eDateStr", opening.geteDate().format(formatter));
            List<ApplyUserDTO> applies = applyService.getApplicants(no);

            model.addAttribute("applies", applies);
            return "openingPage/apply-list";
        }catch (Exception e){
            model.addAttribute("message", e.getMessage());
            return "redirect:/Error.jsp";
        }

    }

    @PostMapping("/acceptApply")
    @ResponseBody
    public String acceptApply(int aNo, int oNo) throws Exception {
        applyService.acceptAndRejectOthers(aNo, oNo);
        return "ok";
    }

    @PostMapping("/rejectApply")
    @ResponseBody
    public ResponseEntity<?> rejectApply(@RequestParam("aNo") int aNo) {
        try {
            applyService.updateApplyStatus(ApplyStatus.reject, aNo);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("거절 처리 실패");
        }
    }

}
