package com.project.perpetcare.service;

import com.project.perpetcare.dao.ApplyDAO;
import com.project.perpetcare.dao.SearchDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchService {

    @Autowired
    private SearchDAO searchDAO;

}
