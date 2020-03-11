package com.barca.ss.service;

import com.barca.ss.domain.Speciality;
import com.barca.ss.domain.SubjectValue;
import com.barca.ss.dto.SubjectValueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class SubjectValueService {

    @Autowired
    private SubjectValueRepository subjectValueRepository;

    public List<SubjectValue> saveAll(Set<SubjectValue> subjectValue) {
        return subjectValueRepository.saveAll(subjectValue);
    }

    public Set<SubjectValue> getAllSubjectAndValueObjectsBySpeciality(Speciality speciality) {
        return subjectValueRepository.getAllBySpecialityOrderById(speciality);
    }
}
