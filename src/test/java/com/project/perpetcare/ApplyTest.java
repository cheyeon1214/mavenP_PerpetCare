package com.project.perpetcare;

import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.Pet;
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

public class ApplyTest {
    @Test
    public void addOpening() throws Exception{
        ArrayList<Pet> pets = new ArrayList<>();

        pets.add(new Pet("codus@naver.com", 1, "romi", "고양이", "코숏", LocalDateTime.now(), "f", null));
        Opening opening = new Opening(0, "codus@naver.com", LocalDateTime.now(), "와주세요", LocalDateTime.now(),  LocalDateTime.of(2025, 8, 10, 2, 10, 00), "12000", "시급", "서초구 방배동", "동물을 좋아하는 사람", "저희는 홈캠이 있습니다.", false, pets);

        Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
        SqlSession session = factory.openSession();
        int result = session.insert("ns.sql.OpeningMapper.addOpening", opening);

        session.commit();
        session.close();

        System.out.println("Insert result: " + result);
    }
}
