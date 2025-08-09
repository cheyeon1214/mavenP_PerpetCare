package com.project.perpetcare.dao;

import com.project.perpetcare.domain.Opening;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class OpeningDAO {
    public static final String NS = "ns.sql.OpeningMapper.";

    @Autowired
    private SqlSession sqlSession;

    public void addOpening(Opening opening) throws Exception{
        sqlSession.insert(NS+"addOpening", opening);
    }

    public void addPostPet(int oNo, int pNo) throws Exception{
        HashMap<String, Integer> map = new HashMap<>();
        map.put("oNo", oNo);
        map.put("pNo", pNo);
        sqlSession.insert(NS+"addPostPet", map);
    }

    public void updateOpening(Opening pvo) throws Exception{
        sqlSession.update(NS+"updateOpening", pvo);
    }

    public List<Opening> getUserOpening(String email) throws Exception{
        return sqlSession.selectList(NS+"getUserOpening", email);
    }

    public void deleteOpening(int oNo) throws Exception {
        sqlSession.delete(NS + "deleteOpening", oNo);
    }

    public Opening getOpening(int no) {
        return sqlSession.selectOne(NS+"getOpening", no);
    }

    public void closeOpening(int oNo) {
        sqlSession.update(NS+"closeOpening", oNo);
    }

    public void matchOpening(int oNo) {
        sqlSession.update(NS+"matchOpening", oNo);
    }
}
