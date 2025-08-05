package com.project.perpetcare.dao;

import com.project.perpetcare.domain.Pet;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PetDAO {
    public static final String NS = "ns.sql.PetMapper.";

    @Autowired
    private SqlSession sqlSession;

    public void insertPet(Pet pet)throws Exception{
        sqlSession.insert(NS+"insertPet", pet);
    }
    public void updatePet(Pet pet)throws Exception{
        sqlSession.update(NS+"updatePet",pet);
    }
    public void deletePet(int no)throws Exception{
        sqlSession.delete(NS+"deletePet",no);
    }
    public List<Pet> getPets(String uEmail)throws Exception{
        return sqlSession.selectList(NS+"getPets",uEmail);
    }

}
