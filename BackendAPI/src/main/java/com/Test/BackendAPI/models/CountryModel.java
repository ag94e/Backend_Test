package com.Test.BackendAPI.models;

import javax.persistence.*;

@Entity
@Table(name = "Country")
public class CountryModel {
    
    @Id
    @SequenceGenerator(name = "Country_SEQ", sequenceName = "SEQ_Country_model")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Country_SEQ")
    private Integer idCountry;
    private String  nameCountry;
    private String  capitalCountry;
    private Long    populationCountry;
    private String  languageCountry;

    public Integer getIdCountry() {
        return idCountry;
    }
    public void setIdCountry(Integer idCountry) {
        this.idCountry = idCountry;
    }
    public String getNameCountry() {
        return nameCountry;
    }
    public void setNameCountry(String nameCountry) {
        this.nameCountry = nameCountry;
    }
    public String getCapitalCountry() {
        return capitalCountry;
    }
    public void setCapitalCountry(String capitalCountry) {
        this.capitalCountry = capitalCountry;
    }
    public Long getPopulationCountry() {
        return populationCountry;
    }
    public void setPopulationCountry(Long populationCountry) {
        this.populationCountry = populationCountry;
    }
    public String getLanguageCountry() {
        return languageCountry;
    }
    public void setLanguageCountry(String languageCountry) {
        this.languageCountry = languageCountry;
    }

    
}
