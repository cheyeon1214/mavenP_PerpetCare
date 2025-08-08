package com.project.perpetcare;


import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.Grade;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;

import java.io.Reader;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import static javax.swing.text.html.HTML.Attribute.N;

public class AuthTest {
//    @Test
//    public void insertUser(){
//        User user = new User("qwert@gmail.com", "이태란", LocalDate.now(), "f", "1234", "01090436414", Grade.Silver, 1);
//        try{
//            Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
//	        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
//	        SqlSession session = factory.openSession();
//	        int result = session.insert("ns.sql.AuthMapper.register", user);
//
//	        session.commit();
//	        session.close();
//
//	        System.out.println("Insert result: " + result);
//        }catch (Exception e){
//            e.printStackTrace();
//
//        }
//    }

    @Test
    public void login() throws Exception{
        User user = new User("codus@naver.com","1234");
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();

        User result=session.selectOne("ns.sql.AuthMapper.login", user);
        System.out.println(result);
        session.close();
    }

    @Test
    public void getUserByEmail() throws Exception{
        String email = "codus@naver.com";
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();

        User result=session.selectOne("ns.sql.AuthMapper.getUserByEmail", email);
        System.out.println(result);
        session.close();
    }

    @Test
    public void sendEmail() throws Exception{
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();

        Map<String,Object> map = new HashMap<>();
        String email = "dalbogi5@gmail.com";
        String code ="223333";

        map.put("email",email);
        map.put("code",code);

        int result=session.insert("ns.sql.AuthMapper.insertCode",map);
        System.out.println(result);
        session.commit();
    }
}
