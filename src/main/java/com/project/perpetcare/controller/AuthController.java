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
    public String doLogin(User pvo, HttpSession session){
        System.out.println("pvo>>"+pvo);
        try{
            User rvo = authService.login(pvo);
            System.out.println("rvo>>"+rvo);
            if(rvo!=null){
                session.setAttribute("user",rvo);
                return "redirect:/home.html";
            }else{
                return "redirect:/login.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg","로그인 중 문제가 발생했습니다.");
            return "redirect:/error.jsp";
        }
    }

}
