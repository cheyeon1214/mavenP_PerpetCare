package com.project.perpetcare.controller;

import com.project.perpetcare.domain.Experience;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.service.ProfileService;
import com.project.perpetcare.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/experience")
public class ExperienceController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProfileService profileService;



    @PostMapping("/update")
    public ResponseEntity<?> updateExperience(HttpSession session, Experience experience) {
        User user = (User) session.getAttribute("user");
        if (user == null) return ResponseEntity.status(401).body(Map.of("ok", false));

        if (experience.getNo() == 0) {
            return ResponseEntity.badRequest()
                    .body(Map.of("ok", false));
        }

        try {
            profileService.updateUserExperience(user.getEmail(), experience);
            return ResponseEntity.ok().body(Map.of("ok", true));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of("fail", false));
        }
    }

    @PostMapping("/delete")
    public ResponseEntity<?> deleteExperience(HttpSession session,int no) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return ResponseEntity.status(401).body(Map.of("ok", false));
        }

        if (no <= 0) {
            return ResponseEntity.badRequest().body(Map.of("fail", false, "message", "삭제 대상이 없습니다."));
        }

        try {
            profileService.deleteUserExperience(user.getEmail(), no);
            return ResponseEntity.ok(Map.of("ok", true));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of("fail", false));
        }
    }

    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> addExperience(HttpSession session, Experience experience) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return ResponseEntity.status(401).body(Map.of("fail", false));
        }
        try {
            experience.setuEmail(user.getEmail());
            experience.setCategory(0);
            profileService.addExperience(experience);
            return ResponseEntity.ok(Map.of("ok", true));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of("fail", false));
        }
    }

}
