package com.project.perpetcare.dao;

import com.project.perpetcare.domain.enums.ApplyStatus;
import com.project.perpetcare.dto.ApplyUserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public class ApplyDAO {
    public static final String NS = "ns.sql.ApplyMapper.";

    @Autowired
    private SqlSession sqlSession;

    public void applyToOpening() throws Exception{
        sqlSession.insert(NS+"applyToOpening");
    }

    public ApplyUserDTO getApplicants() throws Exception{
        return sqlSession.selectOne(NS+"getApplicants");
    }

    public void updateApplyStatus(ApplyStatus status, Integer no) throws Exception{
        HashMap<String,Object> map = new HashMap<>();
        map.put("status",status);
        map.put("no",no);
        sqlSession.update(NS+"updateApplyStatus",map);
    }


}
