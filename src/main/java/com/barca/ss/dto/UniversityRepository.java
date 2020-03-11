package com.barca.ss.dto;

import com.barca.ss.domain.University;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UniversityRepository extends JpaRepository<University, Integer> {
}
