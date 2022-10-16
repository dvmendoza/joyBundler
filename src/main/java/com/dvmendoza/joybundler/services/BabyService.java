package com.dvmendoza.joybundler.services;


import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.dvmendoza.joybundler.models.Baby;
import com.dvmendoza.joybundler.repositories.BabyRepository;

@Service
public class BabyService {
    private final BabyRepository repo;
    public BabyService(BabyRepository repo) {
        this.repo = repo;
    }
    // CREATE
    public Baby create(Baby baby) {
        return repo.save(baby);
    }
    // READ
    public List<Baby> getAll() {
        return repo.findAll();
    }
    public Baby getOne(Long id) {
        Optional<Baby> baby = repo.findById(id);
        return baby.orElse(null);
    }
    // UPDATE
    public Baby update(Baby baby) {
        return repo.save(baby);
    }
    //DELETE
    public void destroy(Baby baby) {
        repo.delete(baby);
    }

}