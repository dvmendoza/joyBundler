package com.dvmendoza.joybundler.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.dvmendoza.joybundler.models.Baby;

public interface BabyRepository extends CrudRepository<Baby, Long> {
	List<Baby> findAll();

}
