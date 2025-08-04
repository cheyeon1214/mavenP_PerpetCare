package com.project.perpetcare.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PetDAO {
    public static final String NS = "ns.sql.PetMapper.";

    @Autowired
    private SqlSession sqlSession;


}
