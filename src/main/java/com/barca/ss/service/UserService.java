package com.barca.ss.service;

import com.barca.ss.domain.User;
import com.barca.ss.domain.UserRole;
import com.barca.ss.dto.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public void save(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setUserRole(UserRole.ROLE_USER);
        userRepository.save(user);
    }

    public User findUserByEmail(String email) {
        Optional<User> user = userRepository.findByEmail(email);

        if(user.isPresent()) {
            return user.get();
        }

        throw new UsernameNotFoundException("No user present with email " + email);
    }

    public User update(User user) {
        return userRepository.save(user);
    }

    public List<User> getUsersWithoutAccepting(Boolean acceptFlag) {
        return userRepository.findAllByIsAcceptedAndEncodedImageNotNull(acceptFlag);
    }
}
