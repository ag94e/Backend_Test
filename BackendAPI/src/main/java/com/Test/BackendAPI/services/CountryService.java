package com.Test.BackendAPI.services;

import java.util.ArrayList;

import com.Test.BackendAPI.models.CountryModel;
import com.Test.BackendAPI.repositories.CountryRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CountryService {
    @Autowired
    CountryRepository countryRepository;

    public ArrayList<CountryModel> getAllCountries(){
        return (ArrayList<CountryModel>) countryRepository.findAll();
    }

    public CountryModel saveCountry(CountryModel country){
        return countryRepository.save(country);
    }
}
