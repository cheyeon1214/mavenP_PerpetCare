package com.project.perpetcare.service;

import com.project.perpetcare.dao.AuthDAO;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.dto.GoogleAuthDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import org.springframework.http.HttpHeaders;

import java.util.Map;
import java.util.Random;

@Service
public class AuthService {

    @Autowired
    private AuthDAO authDAO;

    @Autowired
    private JavaMailSender mailSender;

    public void register(User user) throws Exception {
        authDAO.register(user);
    }

    //인증코드 전송 + 디비 저장
    public void sendVerificationCode(String email) throws Exception {
        String code=generateCode();
        authDAO.insertVerificationCode(email,code);
        sendEmail(email,code);
    }

    private String generateCode() {
        return String.format("%06d", new Random().nextInt(999999));
    }

    public int verifyCode(String email,String code) throws Exception{
        return authDAO.verifyCode(email,code);
    }

    //메일 전송
    private void sendEmail(String toEmail,String code) throws Exception {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("PerpetCare 이메일 인증 코드");
        message.setText("인증 코드: " + code + "\n5분 이내로 입력해주세요.");
        mailSender.send(message);
    }

    public User login(User user) throws Exception {
        return authDAO.login(user);
    }

    public User googleLogin(String accessToken) throws Exception {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(accessToken);
        HttpEntity<String> entity = new HttpEntity<>(headers);

        ResponseEntity<Map> response = restTemplate.exchange(
                "https://www.googleapis.com/oauth2/v1/userinfo?alt=json",
                HttpMethod.GET,
                entity,
                Map.class
        );

        Map<String,Object> userInfo=response.getBody();
        String email = (String)userInfo.get("email");
        String name = (String) userInfo.get("name");
        String gender ="N";
        String phone ="";


        User user = authDAO.getUserByEmail(email);
        if(user != null) {
            user = new User();
            user.setEmail(email);
            user.setName(name);
            user.setGender(gender);
            user.setPhone(phone);
            authDAO.insertGoogleUser(user);
        }
        return user;
    }
    public User getUserByEmail(String email) throws Exception {
        return authDAO.getUserByEmail(email);
    }
}
