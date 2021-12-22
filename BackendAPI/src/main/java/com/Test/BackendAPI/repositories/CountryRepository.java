package com.Test.BackendAPI.repositories;

import com.Test.BackendAPI.models.CountryModel;

import org.springframework.stereotype.Repository;

import org.springframework.data.repository.CrudRepository;

@Repository
public interface CountryRepository extends CrudRepository<CountryModel, Integer> {
    
}
