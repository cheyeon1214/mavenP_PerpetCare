package com.project.perpetcare.dao;

import com.project.perpetcare.domain.Rate;
import com.project.perpetcare.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class RateDAO {
    public static final String NS = "ns.sql.RateMapper.";

    @Autowired
    private SqlSession sqlSession;

    public void addUserRate(Rate rate) throws Exception {
        sqlSession.insert(NS+"addUserRate", rate);
        sqlSession.commit();
    }

    public int getRateNum(String email) throws Exception {
        return sqlSession.selectOne(NS+"getRateNum", email);
    }

    public double getNRatioOfRate(String email) throws Exception {
        return sqlSession.selectOne(NS+"getNRatioOfRate", email);
    }

    public void updateUserGrade(User user) throws Exception {
        sqlSession.update(NS+"updateUserGrade", user);
        sqlSession.commit();
    }

    public String getUserGrade(String email) throws Exception {
        return sqlSession.selectOne(NS+"getUserGrade", email);
    }

    public List<Map<String, Integer>> getUserTopRate(String email) throws Exception {
        // 단순한 데이터 형식 가공이기 때문에 Service 가 아닌 DAO 안에서 수행한다
        List<Map<String, Object>> dataMap = sqlSession.selectList(NS+"getUserTopRate", email);
        List<Map<String, Integer>> result = new ArrayList<>();
        for(Map<String, Object> data : dataMap) {
            Map<String, Integer> temp = new HashMap<>();
            temp.put((String) data.get("r_text"), ((Number) data.get("count")).intValue());
            result.add(temp);
        }
        return result;
    }
}
