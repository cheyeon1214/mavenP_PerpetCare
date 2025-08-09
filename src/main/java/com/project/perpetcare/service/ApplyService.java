package com.project.perpetcare.service;

import com.project.perpetcare.dao.ApplyDAO;
import com.project.perpetcare.dao.OpeningDAO;
import com.project.perpetcare.domain.Apply;
import com.project.perpetcare.domain.enums.ApplyStatus;
import com.project.perpetcare.dto.ApplyUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class ApplyService {

    @Autowired
    private ApplyDAO applyDAO;

    @Autowired
    private OpeningDAO openingDAO;

    public void applyToOpening(Apply apply) throws Exception{
        applyDAO.applyToOpening(apply);
    }

    public List<ApplyUserDTO> getApplicants(int oNo) throws Exception{
        return applyDAO.getApplicants(oNo);
    }

    public void updateApplyStatus(ApplyStatus status, int no) throws Exception{
        applyDAO.updateApplyStatus(status,no);
    }

    @Transactional
    public void acceptAndRejectOthers(int aNo, int oNo) throws Exception {
        // 1. 해당 지원자 수락
        applyDAO.updateApplyStatus(ApplyStatus.accept, aNo);

        // 2. 다른 지원자들 모두 거절
        applyDAO.rejectOthers(oNo, aNo);

        // 3. 공고 닫기
        openingDAO.closeOpening(oNo);

        openingDAO.matchOpening(oNo);

//        // 4. 이메일 전송 (수락자에게)
//        ApplyUserDTO accepted = applyDAO.getApplyUserById(aNo); // 수락자 정보 가져오기
//        emailService.sendAcceptanceEmail(accepted.getuEmail()); // 이메일 전송
    }

    public Map<String, Integer> getGenderStats(int oNo) {
        return applyDAO.selectGenderStats(oNo);
    }

    public Map<String, Integer> getAgeGroupStats(int oNo) {
        return applyDAO.selectAgeGroupStats(oNo);
    }
}
