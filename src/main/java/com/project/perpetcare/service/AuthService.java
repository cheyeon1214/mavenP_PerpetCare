package com.project.perpetcare.service;

import com.project.perpetcare.dao.AuthDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    @Autowired
    private AuthDAO authDAO;

}
