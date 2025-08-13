package com.project.perpetcare.controller;

import com.project.perpetcare.dao.AuthDAO;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.service.AuthService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AuthController {

    @Autowired
    private AuthService authService;

    @Autowired
    private AuthDAO authDAO;

    @GetMapping("/login")
    public String getLogin(){
        return "redirect:/login.jsp";
    }

    @PostMapping("/login")
    public String doLogin(User pvo, HttpSession session, Model model){
        System.out.println("pvo>>"+pvo);
        try{
            User rvo = authService.login(pvo);
            System.out.println("rvo>>"+rvo);
            if(rvo!=null){
                session.setAttribute("user",rvo);
                return "redirect:/home.jsp";
            }else{
                return "redirect:/login.jsp";
            }
        } catch (Exception e) {
            model.addAttribute("message",e.getMessage());
            return "/WEB-INF/views/Error.jsp";
        }
    }

    @GetMapping("/register")
    public String getRegister(){
        return "redirect:/register.jsp";
    }

    @PostMapping("/register")
    public String doRegister(User pvo, String rrn ,HttpSession session, Model model){
        try{
            String[] part = rrn.split("-");

            String bdate = part[0];
            String gender = part[1];

            pvo.setBdate(bdate);
            pvo.setGender(gender);
            System.out.println("pvo>>"+pvo);


            if(authService.getUserByEmail(pvo.getEmail())!=null){
                //이미 등록된 사용자
                return "redirect:/login.jsp";
            }else {
                authService.register(pvo);
                return "redirect:home.jsp";
            }
        } catch (Exception e) {
            model.addAttribute("message",e.getMessage());
            return "/WEB-INF/views/Error.jsp";
        }
    }

    @PostMapping("/sendCode")
    @ResponseBody
    public String sendCode(String email){
        try {
            authService.sendVerificationCode(email);
            return "ok"; // 혹은 JSON 응답도 가능
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @PostMapping("/verifyCode")
    @ResponseBody
    public String verifyCode(String email,String code){
        try {
            int result = authService.verifyCode(email, code); // 1: 성공, 0: 실패
            return result == 1 ? "ok" : "fail";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }


}
