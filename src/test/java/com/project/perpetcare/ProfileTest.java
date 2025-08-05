package com.project.perpetcare;

import com.project.perpetcare.domain.Experience;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.Grade;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;
import java.time.LocalDateTime;

import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

public class ProfileTest {
    private static final String NS = "ns.sql.ProfileMapper.";

    @Test
    public void getUserInfo() throws Exception {
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();

        String email = "codus@naver.com";
        User user = session.selectOne(NS + "getUserInfo", email);
        System.out.println(user);
        session.close();
    }

    @Test
    public void getUserExperience() throws Exception {
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();

        String email = "codus@naver.com";
        User user = session.selectOne(NS + "getUserExperience", email);
        System.out.println(user);
        session.close();
    }

    @Test
    public void getUserRate() throws Exception {
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();

        String email = "codus@naver.com";
        User user = session.selectOne(NS + "getUserRate", email);
        System.out.println(user);
        session.close();
    }

    @Test
    public void updateUserInfo() throws Exception{
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();

        User user = new User("codus@naver.com", "곽채연", "2000-12-14", "f", "1111", "01055821857", Grade.Bronze, 1);

        int result = session.update(NS + "updateUserInfo",user);
        System.out.println(result);
        session.commit();
        session.close();
    }

    @Test
    public void updateUserImg() throws Exception{
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();

        Map<String,String> map=new HashMap<>();
        map.put("email","codus@naver.com");
        map.put("image","2");

        int result=session.update(NS + "updateUserImg",map);
        System.out.println(result);
        session.commit();
        session.close();
    }

    @Test
    public void updateUserExperience() throws Exception{
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();

        String email = "codus@naver.com";
        Experience experience = new Experience("codus@naver.com",1,LocalDateTime.of(2023, 1, 4, 0, 0, 0),LocalDateTime.of(2023, 1, 10, 0, 0, 0),"강아지","포메라니안");
        Map<String,Object> map = new HashMap<>();
        map.put("experience", experience);
        map.put("email",email);

        int result =  session.update(NS + "updateUserExperience",map);
        session.commit();
        session.close();
        System.out.println(result);
    }

    @Test
    public void deleteUserExperience()throws Exception{
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();

        String email="codus@naver.com";
        int no = 1;
        Experience experience = new Experience("codus@naver.com",1,LocalDateTime.of(2023, 1, 4, 0, 0, 0),LocalDateTime.of(2023, 1, 10, 0, 0, 0),"강아지","포메라니안");

        Map<String,Object> map = new HashMap<>();
        map.put("email",email);
        map.put("no",no);

        int result=session.delete(NS + "deleteUserExperience",map);
        System.out.println(result);
        session.commit();
        session.close();
    }
}
