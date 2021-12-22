/*
    1 . Create 2 data table in SQLExpress (SQL senteces)
        A- Countries  (ID int identity,Name varchar,Capital varchar,Population int,LanguageID int)
        B- Languages(ID int identity,Name varchar)
    2. Insert 2 records in each table (SQL senteces)
    3. update the first record the population field by 250000 (SQL senteces)
    4. Delete countries with populations greater than 100,000 (SQL senteces)
    5. Create SQLSentence  joining the 2 tables.
    6. Create SQL Sentence  grouping  by Languages.
    7. Create Store Procedures (Insert,Update,Delete,Select all) 
*/

CREATE TABLE Language (
    IdLanguage INT PRIMARY KEY,
    NameLanguage VARCHAR(50)
);

INSERT INTO Language VALUES (0001, 'English');
INSERT INTO Language VALUES (0002, 'German');
INSERT INTO Language VALUES (0003, 'Spanish');

CREATE TABLE CountryData (
    IdCountry NUMBER PRIMARY KEY,
    NameCountry VARCHAR(100) NOT NULL,
    Capital VARCHAR(100) NOT NULL,
    Population NUMBER NOT NULL,
    LanguageCountry NUMBER NOT NULL,
    CONSTRAINT fk_LanguageName FOREIGN KEY (LanguageCountry) REFERENCES Language(IdLanguage) 
);

INSERT INTO CountryData Values (0001, 'EEUU', 'Washington', 329500000, 0001);
INSERT INTO CountryData Values (0002, 'GERMANY', 'Berlin', 83240000, 0002);
INSERT INTO CountryData Values (0003, 'MEXICO', 'CDMX', 130000000, 0003);
INSERT INTO CountryData Values (0004, 'ARGENTINA', 'Buenos Aires', 50000000, 0003);
--SELECT * FROM Country;

UPDATE CountryData 
    SET Population = 250000
    WHERE IdCountry = 0001;
--SELECT * FROM Country;

DELETE FROM CountryData
    WHERE Population > 100000;  
--SELECT * FROM Country;

SELECT C.NameCountry, C.Capital, C.Population, L.NameLanguage FROM CountryData C
    INNER JOIN Language L ON C.LanguageCountry = L.IdLanguage;

SELECT COUNT(L.IdLanguage), L.NameLanguage FROM CountryData C
    INNER JOIN Language L ON C.LanguageCountry = L.IdLanguage
    GROUP BY L.NameLanguage;

--    7. Create Store Procedures (Insert,Update,Delete,Select all) 
CREATE PROCEDURE SP_INSERT_COUNTRYDATA
(
    COUNTRY_ID IN NUMBER,
    COUNTRY_NAME IN VARCHAR,
    COUNTRY_CAPITAL IN VARCHAR,
    COUNTRY_POPULATION IN NUMBER,
    COUNTRY_LANGUAGE IN NUMBER
)
AS
BEGIN
    INSERT INTO CountryData (IdCountry, NameCountry, Capital, Population, LanguageCountry)
    VALUES (COUNTRY_ID, COUNTRY_NAME, COUNTRY_CAPITAL, COUNTRY_POPULATION, COUNTRY_LANGUAGE);
END;    
-------------------------------------------
CREATE PROCEDURE SP_UPDATE_POP_COUNTRYDATA
(
    COUNTRY_ID IN NUMBER,
    COUNTRY_POPULATION IN NUMBER
)
AS
BEGIN
    UPDATE CountryData 
        SET Population = COUNTRY_POPULATION
        WHERE IdCountry = COUNTRY_ID;
END; 
-------------------------------------------
CREATE PROCEDURE SP_DELETE_POP_COUNTRYDATA
(
    COUNTRY_POPULATION IN NUMBER
)
AS
BEGIN
    DELETE FROM CountryData 
        WHERE Population > COUNTRY_POPULATION;
END; 
-------------------------------------------
CREATE PROCEDURE SP_ALL_COUNTRYDATA
(
    COUNTRY_ID OUT NUMBER,
    COUNTRY_NAME OUT VARCHAR,
    COUNTRY_CAPITAL OUT VARCHAR,
    COUNTRY_POPULATION OUT NUMBER,
    COUNTRY_LANGUAGE OUT NUMBER
)
AS
BEGIN
    SELECT IdCountry, NameCountry, Capital, Population, LanguageCountry
        INTO COUNTRY_ID, COUNTRY_NAME, COUNTRY_CAPITAL, COUNTRY_POPULATION, COUNTRY_LANGUAGE
    FROM CountryData; 
END; 




