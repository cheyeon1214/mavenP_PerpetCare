package com.project.perpetcare;


import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.Grade;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;

import java.io.Reader;

public class UserTest {
    @Test
    public void insertUser(){
        User user = new User("codus@naver.com", "곽채연", "2000-12-14", "f", "1234", "01055821857", Grade.bronze, 1);
        try{
            Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
	        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
	        SqlSession session = factory.openSession();
	        int result = session.insert("ns.sql.UserMapper.addUser", user);

	        session.commit();
	        session.close();

	        System.out.println("Insert result: " + result);
        }catch (Exception e){
            e.printStackTrace();

        }
    }
}
