package com.barca.ss.service;

import com.barca.ss.domain.Speciality;
import com.barca.ss.domain.University;
import com.barca.ss.dto.SpecialityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpecialityService {

    @Autowired
    private SpecialityRepository specialityRepository;

    public Speciality save(Speciality speciality) {
        return specialityRepository.save(speciality);
    }

    public List<Speciality> getAllSpecialitiesByUniversity(University university) {
        return specialityRepository.getSpecialitiesByUniversity(university);
    }

    public Speciality getSpeciality(Integer id) {
        return specialityRepository.getOne(id);
    }

    public List<Speciality> getAllSpecialities() {
        return specialityRepository.findAll();
    }

}
