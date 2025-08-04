package com.project.perpetcare.service;

import com.project.perpetcare.dao.AuthDAO;
import com.project.perpetcare.dao.OpeningDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OpeningService {

    @Autowired
    private OpeningDAO openingDAO;

}
