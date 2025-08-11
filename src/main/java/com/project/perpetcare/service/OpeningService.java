package com.project.perpetcare.service;

import com.project.perpetcare.dao.AuthDAO;
import com.project.perpetcare.dao.OpeningDAO;
import com.project.perpetcare.dao.SearchDAO;
import com.project.perpetcare.domain.Opening;
import com.project.perpetcare.domain.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OpeningService {

    @Autowired
    private OpeningDAO openingDAO;

    @Autowired
    private SearchDAO searchDAO;

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
        List<Opening> openings = openingDAO.getUserOpening(email);
        for(Opening o: openings) {
            String lcode = o.getLocation();
            o.setLocation(searchDAO.searchAddr(lcode)); // 주소 코드 -> 주소명으로 바꿔서 출력
        }
        return openings;
    }

    public Opening getOpening(int no) throws Exception {
        Opening opening = openingDAO.getOpening(no);
        if (opening == null) {
            return null; // 혹은 throw new Exception("Opening not found");
        }

        opening.setLocation(searchDAO.searchAddr(opening.getLocation()));
        return opening;
    }

    public Opening getOpeningOfLcode(int no) throws Exception{
        // 공고 수정을 위한 DB 에서 lcode 그대로 가져오기
        return openingDAO.getOpening(no);
    }

    public void closeOpening(int no) {
        openingDAO.closeOpening(no);
    }
}
