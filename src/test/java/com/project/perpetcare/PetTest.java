package com.project.perpetcare;


import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.domain.User;
import com.project.perpetcare.domain.enums.Grade;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;

import java.io.Reader;
import java.time.LocalDateTime;
import java.util.List;

public class PetTest {
    private static final String NS = "ns.sql.PetMapper.";

    private SqlSession getSqlSession() throws Exception {
        Reader reader = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(reader);
        SqlSession session = factory.openSession();
        return session;
    }
    @Test
    public void insertPet() throws Exception{
        SqlSession session = getSqlSession();
        User user = new User("codus@naver.com", "곽채연", "2024-08-04", "f", "1234", "01055821857", Grade.bronze, 2);
        session.insert("ns.sql.AuthMapper.register", user);
        Pet pet = new Pet(1,"codus@naver.com","로미","고양이","코숏", LocalDateTime.now(),"f",null);
        session.insert(NS+"insertPet",pet);
        System.out.println("=============insertPet 완료==============");
        session.commit();
        session.close();
    }
//    @Test
//    public void updatePet() throws Exception{
//        SqlSession session = getSqlSession();
//        Pet pet = new Pet(3,"codus@naver.com","로디","고양이","코숏", LocalDateTime.now(),"f",null);
//        session.update(NS+"updatePet",pet);
//        System.out.println("=============updatePet 완료==============");
//        session.commit();
//        session.close();
//    }
//    @Test
//    public void deletePet() throws Exception{
//        SqlSession session = getSqlSession();
//        session.delete(NS+"deletePet",3);
//        System.out.println("=============deletePet 완료==============");
//        session.commit();
//        session.close();
//    }
    @Test
    public void selectPet() throws Exception{
        SqlSession session = getSqlSession();
        List<Pet> list = session.selectList(NS+"selectPet","codus@naver.com");
        list.forEach(pet -> System.out.println(pet));
        System.out.println("=============selectPet 완료==============");
        session.commit();
        session.close();
    }

}
