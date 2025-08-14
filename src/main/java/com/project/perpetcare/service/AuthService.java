package com.project.perpetcare.service;

import com.project.perpetcare.dao.AuthDAO;
import com.project.perpetcare.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import org.springframework.http.HttpHeaders;

import java.sql.Date;
import java.util.Map;
import java.util.Random;

@Service
public class AuthService {

    @Autowired
    SqlSession sqlSession;

    @Autowired
    private AuthDAO authDAO;

    @Autowired
    private JavaMailSender mailSender;

    public void register(User user) throws Exception {
        String bdate = user.getBdate();
        String genderCode = user.getGender();

        String bdateYear= null;
        if(genderCode.equals("1") || genderCode.equals("2")){
            bdateYear = "19";
        }else if(genderCode.equals("3") || genderCode.equals("4")){
            bdateYear = "20";
        }

        String fullbdate = bdateYear+bdate;
        System.out.println("fullbdate>>"+fullbdate);
        String formattedDate = fullbdate.substring(0, 4) + "-" +
                fullbdate.substring(4, 6) + "-" +
                fullbdate.substring(6, 8);
        System.out.println("formattedDate>>"+formattedDate);
        Date sqlDate = Date.valueOf(formattedDate);
        System.out.println("sqlDate >>"+sqlDate);
        user.setBdate(sqlDate.toString());

        String gender=null;
        if(genderCode.equals("1") || genderCode.equals("3")){
            gender = "m";
        }else if(genderCode.equals("2") || genderCode.equals("4")){
            gender = "f";
        }
        System.out.println("gender>>"+gender);
        user.setGender(gender);

        authDAO.register(user);
    }

    //인증코드 전송 + 디비 저장
    public void sendVerificationCode(String email) throws Exception {
        String code=generateCode();
        authDAO.insertCode(email,code);
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
        String gender ="n";
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
