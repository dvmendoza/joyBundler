package com.dvmendoza.joybundler.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.dvmendoza.joybundler.models.LoginUser;
import com.dvmendoza.joybundler.models.User;
import com.dvmendoza.joybundler.repositories.UserRepository;

@Service
public class UserService {
    @Autowired
    UserRepository repo;

    public User register(User user, BindingResult result) {
        if (repo.findByEmail(user.getEmail()).isPresent()) {
            result.rejectValue("email", "Taken", "Email is already in use");
        }
        if (!user.getPassword().equals(user.getConfirm())) {
            result.rejectValue("confirm", "Matches", "Passwords must match");
        }
        if (result.hasErrors()) {
            return null;
        }
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        repo.save(user);
        return user;
    }
    public User login(@Valid LoginUser loginUser, BindingResult result) {
        // Create potential user
        // Find user in the DB by email
        Optional<User> userToLogin = repo.findByEmail(loginUser.getEmail());
        // Reject if NOT present
        if(!userToLogin.isPresent()){
            result.rejectValue("email", "Matches", "User not Found");
            System.out.println(result);
            return null;
        }
        // User exists if you get to this line, so retrieve user from DB
        User user = userToLogin.get();
        // Reject if BCrypt password match fails
        if(!BCrypt.checkpw(loginUser.getPassword(), user.getPassword())){
            result.rejectValue("password", "Matches", "Invalid Credentials");
        }
        // Return null if result has errors
        if(result.hasErrors()){
            return null;
        }
        // Otherwise, return the user object
        return user;
    }
    // CRUD Methods
    public List<User> getAll() {
        return repo.findAll();
    }
    public User getOne(Long id) {
        Optional<User> user = repo.findById(id);
        return user.orElse(null);
    }
    public void update(User user) { repo.save(user); }
    public void delete(Long id) {
        repo.deleteById(id);
    }
    
    public User findByEmail(String email) {
    	return repo.findByEmail(email).orElse(null);
    }
    
}