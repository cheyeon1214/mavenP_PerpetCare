package com.project.perpetcare.service;

import com.project.perpetcare.dao.ApplyDAO;
import com.project.perpetcare.dao.SearchDAO;
import com.project.perpetcare.domain.Location;
import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.dto.Condition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchService {

    @Autowired
    private SearchDAO searchDAO;

    public List<Location> searchLoc(String word) throws Exception {
        return searchDAO.searchLoc(word);
    }

    public List<Opening> searchOpenings(Condition condition) throws Exception {
        return searchDAO.searchOpenings(condition);
    }
}