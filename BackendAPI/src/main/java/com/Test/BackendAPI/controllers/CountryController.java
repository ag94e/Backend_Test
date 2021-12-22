package com.Test.BackendAPI.controllers;

import java.util.ArrayList;

import com.Test.BackendAPI.models.CountryModel;
import com.Test.BackendAPI.services.CountryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/country")
public class CountryController {
    @Autowired
    CountryService countryService;
    
    @GetMapping()
    public ArrayList<CountryModel> getAllCountries(){
        return countryService.getAllCountries();
    }

    @PostMapping()
    public CountryModel saveCountry(@RequestBody CountryModel country){
        return this.countryService.saveCountry(country);
    }
}
