package com.barca.ss.service;

import com.barca.ss.domain.Exams;
import com.barca.ss.domain.Subjects;
import com.barca.ss.domain.User;
import com.barca.ss.dto.ExamsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

@Service
@Transactional
public class ExamsService {

    @Autowired
    private ExamsRepository examsRepository;

   public List<Exams> saveAllExams(Set<Exams> exams) {
       return examsRepository.saveAll(exams);
   }

   public Set<Exams> getAllExamsByUser(User user) {
       return examsRepository.getAllByUser(user);
   }

   public Exams getCertificateForAccepting(User user, Subjects subjects) {
       return examsRepository.getByUserAndSubject(user, subjects);
   }

   public void deleteUserExams(User user) {
       examsRepository.deleteAllByUserId(user.getId());
   }
}
