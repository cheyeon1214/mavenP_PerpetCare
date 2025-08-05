package com.project.perpetcare.service;

import com.project.perpetcare.dao.ApplyDAO;
import com.project.perpetcare.dao.OpeningDAO;
import com.project.perpetcare.domain.Apply;
import com.project.perpetcare.domain.enums.ApplyStatus;
import com.project.perpetcare.dto.ApplyUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplyService {

    @Autowired
    private ApplyDAO applyDAO;

    public void applyToOpening(Apply apply) throws Exception{
        applyDAO.applyToOpening(apply);
    }

    public List<ApplyUserDTO> getApplicants(int oNo) throws Exception{
        return applyDAO.getApplicants(oNo);
    }

    public void updateApplyStatus(ApplyStatus status, int no) throws Exception{
        applyDAO.updateApplyStatus(status,no);
    }

}
