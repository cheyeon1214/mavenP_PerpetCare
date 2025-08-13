package com.project.perpetcare.controller;

import com.project.perpetcare.domain.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SearchPageController {

    @GetMapping("/search")
    public String getSearch(HttpSession session, Model model) {
        try{
            User user = (User) session.getAttribute("user");
            if(user == null) {
                return "redirect:/login";
            }
            model.addAttribute("user", user);
            return "search"; // 결과 페이지 경로 /WEB-INF/views/search .jsp
        } catch (Exception e) {
            model.addAttribute("error", "페이지를 불러오는 도중 문제가 발생했습니다.");
            return "Error";
        }
    }
}