package com.barca.ss.service;

import com.barca.ss.domain.Speciality;
import com.barca.ss.domain.SubmissionOfDocument;
import com.barca.ss.domain.User;
import com.barca.ss.dto.SubmissionOfDocumentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SubmissionOfDocumentService {

    @Autowired
    private SubmissionOfDocumentRepository submission;

    public List<SubmissionOfDocument> getUserSubmission(User user) {
        return submission.findAllByUser(user);
    }

    public SubmissionOfDocument save(SubmissionOfDocument submissionOfDocument){
        return submission.save(submissionOfDocument);
    }

    public List<SubmissionOfDocument> getOrderedByAverageMarkSubmission(Speciality speciality) {
        return submission.findAllBySpecialityOrderByAverageMarkDesc(speciality);
    }

    public SubmissionOfDocument update(SubmissionOfDocument submissionOfDocument) {
        return submission.save(submissionOfDocument);
    }

    public void deleteAllByUserAndIsEnteredValue(User user, Boolean flag) {
        submission.deleteAllByUserAndIsEntered(user, flag);
    }
}
