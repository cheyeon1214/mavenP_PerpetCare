package com.project.perpetcare.service;

import com.project.perpetcare.dao.ApplyDAO;
import com.project.perpetcare.dao.ProfileDAO;
import com.project.perpetcare.dao.RateDAO;
import com.project.perpetcare.domain.Rate;
import com.project.perpetcare.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class RateService {

    @Autowired
    private RateDAO rateDAO;

    @Autowired
    private ProfileDAO profileDAO;

    public void addUserRate(Rate rate) throws Exception {
        rateDAO.addUserRate(rate);
//      평가 추가 후 등급 업데이트 바로
        User user = profileDAO.getUserInfo(rate.getToEmail());
        rateDAO.updateUserGrade(user);
    }

    public int getRateNum(String email) throws Exception {
        return rateDAO.getRateNum(email);
    }

    public double getNRatioOfRate(String email) throws Exception {
        return rateDAO.getNRatioOfRate(email);
    }

    public void updateUserGrade(User user) throws Exception {
        rateDAO.updateUserGrade(user);
    }

    public String getUserGrade(String email) throws Exception {
        return rateDAO.getUserGrade(email);
    }

    public List<Map<String, Integer>> getUserTopRate(String email) throws Exception {
        return rateDAO.getUserTopRate(email);
    }

    public boolean hasRated(String fromEmail, int oNo) {
        Integer count = rateDAO.countUserRate(fromEmail, oNo); // DAO 호출
        return count != null && count > 0;
    }
}