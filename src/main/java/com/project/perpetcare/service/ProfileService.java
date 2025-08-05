package com.project.perpetcare.service;

import com.project.perpetcare.dao.AuthDAO;
import com.project.perpetcare.dao.ProfileDAO;
import com.project.perpetcare.domain.Experience;
import com.project.perpetcare.domain.Rate;
import com.project.perpetcare.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ProfileService {

    @Autowired
    private ProfileDAO profileDAO;

    public User getUserInfo(String email) throws Exception {
        return profileDAO.getUserInfo(email);
    }

    public List<Experience> getUserExperience(String email) throws Exception{
        return profileDAO.getUserExperience(email);
    }

    public List<Rate> getUserRate(String email) throws Exception{
        return profileDAO.getUserRate(email);
    }

    public void updateUserInfo(User user) throws Exception{
        profileDAO.updateUserInfo(user);
    }

    public void updateUserImg(String email,String image) throws Exception{
        profileDAO.updateUserImg(email,image);
    }

    public void updateUserExperience(String email,Experience experience) throws Exception{
        profileDAO.updateUserExperience(email,experience);
    }

    public void deleteUserExperience(String email,int no) throws Exception{
        profileDAO.deleteUserExperience(email,no);
    }
}
