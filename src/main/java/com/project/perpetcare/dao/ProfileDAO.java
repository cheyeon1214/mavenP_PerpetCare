package com.project.perpetcare.dao;

import com.project.perpetcare.domain.Experience;
import com.project.perpetcare.domain.Rate;
import com.project.perpetcare.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class ProfileDAO {
    public static final String NS = "ns.sql.ProfileMapper.";

    @Autowired
    private SqlSession sqlSession;

    public User getUserInfo(String email) throws Exception {
        return sqlSession.selectOne(NS+"getUserInfo", email);
    }

    public List<Experience> getUserExperience(String email) throws Exception {
        return sqlSession.selectList(NS+"getUserExperience", email);
    }

    public List<Rate> getUserRate(String email) throws Exception {
        return sqlSession.selectList(NS+"getUserRate", email);
    }

    public void updateUserInfo(User user) throws Exception {
        sqlSession.update(NS+"updateUserInfo", user);
        sqlSession.commit();
    }

    public void updateUserImg(String email,String image) throws Exception {
        HashMap<String,Object> map = new HashMap<>();
        map.put("email",email);
        map.put("image",image);
        sqlSession.update(NS+"updateUserImg", map);
        sqlSession.commit();
    }

    public void updateUserExperience(String email,Experience experience) throws Exception {
        HashMap<String,Object> map = new HashMap<>();
        map.put("email",email);
        map.put("experience",experience);
        sqlSession.update(NS+"updateUserExperience", map);
        sqlSession.commit();
    }

    public void deleteUserExperience(String email,int no) throws Exception {
        HashMap<String,Object> map = new HashMap<>();
        map.put("email",email);
        map.put("no",no);
        sqlSession.delete(NS+"deleteUserExperience", map);
        sqlSession.commit();
    }
}
