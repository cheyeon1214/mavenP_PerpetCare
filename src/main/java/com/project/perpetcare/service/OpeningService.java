package com.project.perpetcare.service;

import com.project.perpetcare.dao.AuthDAO;
import com.project.perpetcare.dao.OpeningDAO;
import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OpeningService {

    @Autowired
    private OpeningDAO openingDAO;

    public void addOpening(Opening opening)throws Exception{
        openingDAO.addOpening(opening);
    }

    public void addPostPet(int oNo, int pNo) throws Exception{
        openingDAO.addPostPet(oNo, pNo);
    }

    public void updateOpening(Opening pvo) throws Exception{
        openingDAO.updateOpening(pvo);
    }

    public void deleteOpening(int no) throws Exception{
        openingDAO.deleteOpening(no);
    }

    public List<Opening> getUserOpening(String email) throws Exception{
        return openingDAO.getUserOpening(email);
    }

    public Opening getOpening(int no) throws Exception{
        return openingDAO.getOpening(no);
    }

}
