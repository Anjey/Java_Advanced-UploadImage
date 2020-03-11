package com.barca.ss.service;

import com.barca.ss.domain.University;
import com.barca.ss.dto.UniversityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UniversityService {

    @Autowired
    private UniversityRepository universityRepository;

    public University save(University university) {
        return universityRepository.save(university);
    }

    public List<University> getAllUniversities() {
        return universityRepository.findAll();
    }

    public University getUniversity(Integer id) {
        return universityRepository.getOne(id);
    }
}
