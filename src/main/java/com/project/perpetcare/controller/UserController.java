package com.project.perpetcare.controller;

import com.project.perpetcare.domain.User;
import com.project.perpetcare.service.ApplyService;
import com.project.perpetcare.service.ProfileService;
import com.project.perpetcare.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.apache.coyote.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProfileService profileService;

    @PostMapping("/imgUpdate")
    public ResponseEntity<?> updateImg (HttpSession session, int image) throws Exception {
        User user=(User)session.getAttribute("user");
        int idx = normalizeAvatar(image);
        try{
            profileService.updateUserImg(user.getEmail(),idx);

            user.setImage(idx);
            session.setAttribute("user", user);

            return ResponseEntity.ok(Map.of(
                    "ok", true,
                    "image", idx,
                    "imagePath", user.getImagePath()
            ));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of("ok", false));
        }
    }

    private int normalizeAvatar(Object avatar) {
        if (avatar == null) return 1;

        // 숫자로 온 경우
        try {
            int n = Integer.parseInt(String.valueOf(avatar));
            return (n >= 1 && n <= 6) ? n : 1;
        } catch (NumberFormatException ignore) {}

        // "profile_3.svg" 같은 파일명
        var m = java.util.regex.Pattern.compile("profile_(\\d+)\\.svg$").matcher(String.valueOf(avatar));
        if (m.find()) {
            int n = Integer.parseInt(m.group(1));
            return (n >= 1 && n <= 6) ? n : 1;
        }
        return 1;
    }

    @PostMapping("/updateUserInfo")
    public ResponseEntity<?> updateUserInfo(HttpSession session,String pwd,String phone) throws Exception {
        User user=(User)session.getAttribute("user");
        try{
            if(pwd !=null && !pwd.isBlank()){
                user.setPwd(pwd);
                profileService.updateUserPwd(user);
            }

            if(phone !=null && !phone.isBlank()){
                user.setPhone(phone);
                profileService.updateUserPhone(user);
                session.setAttribute("user",user);
            }
            return ResponseEntity.ok(Map.of("ok", true));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of("ok", false));
        }
    }

}
