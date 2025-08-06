package com.project.perpetcare;

import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.dto.Condition;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;

import java.io.Reader;
import java.time.LocalDateTime;
import java.util.List;

public class SearchTest {

    @Test
    public void searchOpenings() throws Exception{
        Condition condition = new Condition(true, LocalDateTime.of(2025, 7, 1, 0, 0, 0), LocalDateTime.of(2025, 7, 31, 0, 0, 0), "1165010100", "잠시 맡아주세요", "고양이", null);
        try {
            Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
            SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
            SqlSession session = factory.openSession();
            List<Opening> openings = session.selectList("ns.sql.SearchMapper.searchOpenings", condition);
            for (Opening opening : openings) {
                System.out.println(opening);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}