package com.project.perpetcare;

import com.project.perpetcare.domain.Apply;
import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.Pet;
import com.project.perpetcare.domain.enums.ApplyStatus;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;

import java.io.Reader;
import java.sql.Array;
import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ApplyTest {
    @Test
    public void addOpening() throws Exception{
        ArrayList<Pet> pets = new ArrayList<>();

        pets.add(new Pet(1, "codus@naver.com", "romi", "고양이", "코숏", LocalDateTime.now(), "f", null));
        Opening opening = new Opening(0, "codus@naver.com", LocalDateTime.now(), "와주세요", LocalDateTime.now(),  LocalDateTime.of(2025, 8, 10, 2, 10, 00), "12000", "시급", "서초구 방배동", "동물을 좋아하는 사람", "저희는 홈캠이 있습니다.", false, pets);

        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();
        int result = session.insert("ns.sql.OpeningMapper.addOpening", opening);

        session.commit();
        session.close();

        System.out.println("Insert result: " + result);
    }

    @Test
    public void addPostPet() throws Exception{
        ArrayList<Pet> pets = new ArrayList<>();
        pets.add(new Pet(1, "codus@naver.com", "romi", "고양이", "코숏", LocalDateTime.now(), "f", null));
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();
        HashMap<String, Integer> map = new HashMap<>();
        map.put("oNo", 3);
        map.put("pNo", 1);
        int result = session.insert("ns.sql.OpeningMapper.addPostPet", map);

        session.commit();
        session.close();

        System.out.println("Insert result: " + result);
    }

    @Test
    public void updateOpening() throws Exception{

        Opening opening = new Opening(2, "codus@naver.com", LocalDateTime.now(), "맡아주세요", LocalDateTime.now(),  LocalDateTime.of(2025, 8, 11, 2, 30, 00), "12000", "시급", "서초구 방배3동", "동물을 좋아하는 사람", "저희는 홈캠이 있습니다.", false, null);
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();
        int result = session.update("ns.sql.OpeningMapper.updateOpening", opening);
        session.commit();
        session.close();
        System.out.println("Update result: " + result);

    }

    @Test
    public void getUserOpening() throws Exception{
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();
        List<Opening> openings = session.selectList("ns.sql.OpeningMapper.getUserOpening", "codus@naver.com");
        for (Opening opening : openings) {
            System.out.println(opening);
        }
    }

    @Test
    public void deleteOpening() throws Exception{
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();
        int result = session.delete("ns.sql.OpeningMapper.deleteOpening",2);
        session.commit();
        session.close();
        System.out.println("Delete result: " + result);
    }

    @Test
    public void applyOpening() throws Exception {
        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();
        Apply apply = new Apply(1, "codus@naver.com", 3, LocalDateTime.now(), "로미를사랑합니다", ApplyStatus.pending);
        int result = session.insert("ns.sql.ApplyMapper.applyToOpening", apply);
        session.commit();
        session.close();
        System.out.println("Insert result: " + result);
    }




}
