package com.project.perpetcare;


import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.Grade;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;

import java.io.Reader;

public class AuthTest {
    @Test
    public void insertUser(){
        User user = new User("qwert@gmail.com", "이태란", "2001-05-05", "f", "1234", "01090436414", Grade.Silver, 1);
        try{
            Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
	        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
	        SqlSession session = factory.openSession();
	        int result = session.insert("ns.sql.AuthMapper.register", user);

	        session.commit();
	        session.close();

	        System.out.println("Insert result: " + result);
        }catch (Exception e){
            e.printStackTrace();

        }
    }

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
}
