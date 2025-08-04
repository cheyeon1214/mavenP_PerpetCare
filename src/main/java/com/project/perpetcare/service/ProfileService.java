package com.project.perpetcare.service;

import com.project.perpetcare.dao.AuthDAO;
import com.project.perpetcare.dao.ProfileDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfileService {

    @Autowired
    private ProfileDAO profileDAO;

}
