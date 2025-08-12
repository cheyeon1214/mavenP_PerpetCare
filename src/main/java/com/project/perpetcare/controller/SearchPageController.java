package com.project.perpetcare.controller;

import com.project.perpetcare.domain.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SearchPageController {

    @GetMapping("/search")
    public String searchPage(HttpSession session, Model model) {
        try{
            User user = (User) session.getAttribute("user");
            if(user == null) {
                return "redirect:/login";
            }
            model.addAttribute("user", user);
            return "search"; // 결과 페이지 경로 /WEB-INF/views/search .jsp
        } catch (Exception e) {
            e.printStackTrace();
            return "/Error.jsp";
        }
    }
}