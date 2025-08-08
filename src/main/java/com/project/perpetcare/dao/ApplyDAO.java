package com.project.perpetcare.dao;

import com.project.perpetcare.domain.Apply;
import com.project.perpetcare.domain.enums.ApplyStatus;
import com.project.perpetcare.dto.ApplyUserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ApplyDAO {
    public static final String NS = "ns.sql.ApplyMapper.";

    @Autowired
    private SqlSession sqlSession;

    public void applyToOpening(Apply apply) throws Exception{
        sqlSession.insert(NS+"applyToOpening", apply);
    }

    public List<ApplyUserDTO> getApplicants(int oNo) throws Exception{
        return sqlSession.selectList(NS+"getApplicants", oNo);
    }

    public void updateApplyStatus(ApplyStatus status, int no) throws Exception{
        HashMap<String,Object> map = new HashMap<>();
        map.put("status",status);
        map.put("no",no);
        sqlSession.update(NS+"updateApplyStatus",map);
    }


    public void rejectOthers(int oNo, int aNo) {
        Map<String, Object> map = new HashMap<>();
        map.put("oNo", oNo);
        map.put("aNo", aNo);

        sqlSession.update(NS + "rejectOthers", map);
    }

    public Map<String, Integer> selectGenderStats(int oNo) {
        @SuppressWarnings("unchecked")
        Map<String, Integer> res = (Map<String, Integer>) sqlSession.selectOne(NS + "selectGenderStats", oNo);
        if (res == null) res = new HashMap<>();
        // null 일때 기본값 0 넣기
        res.putIfAbsent("f", 0);
        res.putIfAbsent("m", 0);
        res.putIfAbsent("n", 0);
        return res;
    }

    @SuppressWarnings("unchecked")
    public Map<String, Integer> selectAgeGroupStats(int oNo) {
        Map<String, Object> raw = (Map<String, Object>) sqlSession.selectOne(NS + "selectAgeGroupStats", oNo);
        Map<String, Integer> res = new HashMap<>();
        for (String k : List.of("20대","30대","40대","미상")) {
            res.put(k, raw == null ? 0 : ((Number) raw.getOrDefault(k, 0)).intValue());
        }
        return res;
    }

}
