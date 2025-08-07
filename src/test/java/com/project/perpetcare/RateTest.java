package com.project.perpetcare;

import com.project.perpetcare.domain.Rate;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.Grade;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;

import java.io.Reader;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public class RateTest {

    @Test
    public void addUserRate() throws Exception{
            Rate rate = new Rate(6, "codus@naver.com", "codus@naver.com", 6, "P02", LocalDateTime.now());
        try {
            Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
            SqlSession session = factory.openSession();
            int result = session.insert("ns.sql.RateMapper.addUserRate", rate);
            session.commit();
            session.close();
            System.out.println("Insert Result : "+result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void getRateNum() throws Exception {
        String email = "codus@naver.com";
        try {
            Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
            SqlSession session = factory.openSession();
            int num = session.selectOne("ns.sql.RateMapper.getRateNum", email);
            System.out.println("Num of User's Rate : "+num);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void getNRatioOfRate() throws Exception {
        String email = "codus@naver.com";
        try {
            Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
            SqlSession session = factory.openSession();
            double nRatio = session.selectOne("ns.sql.RateMapper.getNRatioOfRate", email);
            System.out.println("Negative Ratio of User's Rate : "+nRatio);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void updateUserGrade() throws Exception {
        User user = new User("codus@naver.com", "곽채연", LocalDate.now(), "f", "1122", "01055821857", Grade.Bronze, 1);
        try {
            Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
            SqlSession session = factory.openSession();
            int result = session.update("ns.sql.RateMapper.updateUserGrade", user);
            session.commit();
            session.close();
            System.out.println("Update Result : "+result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void getUserGrade() throws Exception {
        String email = "codus@naver.com";
        try {
            Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
            SqlSession session = factory.openSession();
            String grade = session.selectOne("ns.sql.RateMapper.getUserGrade", email);
            System.out.println("User Grade : "+grade);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void getUserTopRate() throws Exception {
        String email = "codus@naver.com";
        try {
            Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
            SqlSession session = factory.openSession();
            // List<String> rates = session.selectList("ns.sql.RateMapper.getUserTopRate", email);
            List<Map<String, Integer>> rates = session.selectList("ns.sql.RateMapper.getUserTopRate", email);
            for(Map<String, Integer> rate : rates) {
                for(Map.Entry<String, Integer> data : rate.entrySet()) {
                    System.out.println(data.getKey()+" : "+data.getValue());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}