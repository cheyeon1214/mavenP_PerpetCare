package com.project.perpetcare.dao;

import com.project.perpetcare.domain.Experience;
import com.project.perpetcare.domain.Rate;
import com.project.perpetcare.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProfileDAO {
    public static final String NS = "ns.sql.ProfileMapper.";

    @Autowired
    private SqlSession sqlSession;

    public User getUserInfo(String email) throws Exception {
        return sqlSession.selectOne(NS+"getUserInfo", email);
    }

    public List<Experience> getUserExperience(String email,int category) throws Exception {
        Map<String,Object> map = new HashMap<>();
        map.put("email",email);
        map.put("category",category);
        return sqlSession.selectList(NS+"getUserExperience", map);
    }

    public List<Rate> getUserRate(String email) throws Exception {
        return sqlSession.selectList(NS+"getUserRate", email);
    }

    public void updateUserPwd(User user) throws Exception {
        sqlSession.update(NS+"updateUserPwd", user);
    }

    public void updateUserPhone(User user) throws Exception {
        sqlSession.update(NS+"updateUserPhone", user);
    }

    public void updateUserImg(String email,int image) throws Exception {
        HashMap<String,Object> map = new HashMap<>();
        map.put("email",email);
        map.put("image",image);
        sqlSession.update(NS+"updateUserImg", map);
    }

    public void updateUserExperience(String email,Experience experience) throws Exception {
        HashMap<String,Object> map = new HashMap<>();
        map.put("email",email);
        map.put("experience",experience);
        sqlSession.update(NS+"updateUserExperience", map);
    }

    public void deleteUserExperience(String email,int no) throws Exception {
        HashMap<String,Object> map = new HashMap<>();
        map.put("email",email);
        map.put("no",no);
        sqlSession.delete(NS+"deleteUserExperience", map);
    }

    public void addExperience(Experience experience) throws Exception {
        sqlSession.insert(NS+"addExperience", experience);
    }
}
