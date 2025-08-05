package com.project.perpetcare.dao;

import com.project.perpetcare.domain.User;
import com.project.perpetcare.dto.GoogleAuthDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class AuthDAO {
    public static final String NS = "ns.sql.AuthMapper.";

    @Autowired
    private SqlSession sqlSession;

    public void register(User user) throws Exception {
        sqlSession.insert(NS+"register", user);
        sqlSession.commit();
    }

    public void insertVerificationCode(String email,String code) throws Exception {
        Map<String,Object> map = new HashMap<>();
        map.put("email",email);
        map.put("code",code);
        sqlSession.insert(NS+"insertVerificationCode", map);
        sqlSession.commit();
    }

    public int verifyCode(String email,String code) throws Exception {
        Map<String,Object> map = new HashMap<>();
        map.put("email",email);
        map.put("code",code);
        return sqlSession.selectOne(NS+"verifyCode", map);
    }

    public User login(User user) throws Exception {
        return sqlSession.selectOne(NS+"login", user);
    }

    public void insertGoogleUser(User user) throws Exception {
        sqlSession.insert(NS+"insertGoogleUser", user);
        sqlSession.commit();
    }

    public User getUserByEmail(String email) throws Exception {
        return sqlSession.selectOne(NS+"getUserByEmail", email);
    }
}
