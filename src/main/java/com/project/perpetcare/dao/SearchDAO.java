package com.project.perpetcare.dao;

import com.project.perpetcare.domain.Location;
import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.dto.Condition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SearchDAO {
    public static final String NS = "ns.sql.SearchMapper.";

    @Autowired
    private SqlSession sqlSession;

    public List<Location> searchLoc(String word) throws Exception {
        return sqlSession.selectList(NS+"searchLoc", word);
    }

    public List<Opening> searchOpenings(Condition condition) throws Exception {
        return sqlSession.selectList(NS+"searchOpenings", condition);
    }
}