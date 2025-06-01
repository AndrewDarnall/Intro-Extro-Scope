-- Script to setup the entire database, table and import of the datasets --


-- Create the Schemas --
create schema GDELT23;
create schema COMMONCRAWL25;
create schema INTROEXTROBEH;

-- Select and create the table for GDELT23 --
use GDELT23;

CREATE TABLE events (
    GlobalEventID BIGINT PRIMARY KEY,
    Date DATE,
    MonthYear CHAR(6),
    Year SMALLINT,
    FractionalDate FLOAT,
    Actor1Code VARCHAR(50),
    Actor1Name VARCHAR(255),
    Actor1CountryCode CHAR(3),
    Actor2Code VARCHAR(50),
    Actor2Name VARCHAR(255),
    EventCode VARCHAR(10),
    GoldsteinScale FLOAT,
    NumMentions INT,
    NumSources INT,
    NumArticles INT,
    AvgTone FLOAT,
    GeoType SMALLINT,
    GeoName VARCHAR(255),
    CountryCode CHAR(3),
    Latitude DECIMAL(9,6),
    Longitude DECIMAL(9,6),
    URL TEXT
) ENGINE=CSV;




-- Import the GDELT23 data --
LOAD DATA INFILE 'D:\\01-Large-GitHub-Projects\\The-Web-Under-Glass\\data\\01-GDELT-23\\gdelt_merged.csv'
INTO TABLE events
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


-- Repeat for common crawl --
use COMMONCRAWL25;

CREATE TABLE data_records (
    URL TEXT,
    DATE DATE,
    LANGUAGE VARCHAR(10),
    TEXT TEXT             
);


-- Import the COMMONCRAWL25 data --
LOAD DATA INFILE 'D:\\01-Large-GitHub-Projects\\The-Web-Under-Glass\\data\\02-Common-Crawl\\common_crawl_data.csv'
INTO TABLE events
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Repeat for Introvert and Extrovert Behavior Analysis --
use INTROEXTROBEH;

CREATE TABLE personality_traits (
    Time_spent_Alone INT,            
    Stage_fear BOOLEAN,              
    Social_event_attendance INT,     
    Going_outside BOOLEAN,           
    Drained_after_socializing BOOLEAN, 
    Friends_circle_size INT,         
    Post_frequency INT,             
    Personality VARCHAR(50)          
);

-- Import the Extrovert vs Introvert Behavior Analysis --
LOAD DATA INFILE 'D:\\01-Large-GitHub-Projects\\The-Web-Under-Glass\\data\\03-Introvert-vs-Extrovert-Behavior\\personality_dataset.csv'
INTO TABLE events
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;