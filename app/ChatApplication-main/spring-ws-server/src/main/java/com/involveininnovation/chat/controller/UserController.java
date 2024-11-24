package com.involveininnovation.chat.controller;

import com.involveininnovation.chat.model.User;
import com.involveininnovation.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private final UserRepository userRepository;

    @Autowired
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/all")
    //@PreAuthorize("hasRole('USER')")
    public ResponseEntity<List<User>> allAccess() {
        List<User> users = userRepository.findAll();
        return ResponseEntity.ok(users);
    }

    @PostMapping("/create")
    //@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity<User> createUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();

            boolean userExists = userRepository.existsByEmail(username);

            if(userExists) {
                return ResponseEntity.status(HttpStatus.CONFLICT).build();
            } else {
                User newUser = new User();
                newUser.setEmail(username);
                return ResponseEntity.status(HttpStatus.CREATED).body(userRepository.save(newUser));
            }
        } else {
            return ResponseEntity.badRequest().build();
        }
    }
}
