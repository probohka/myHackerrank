-- =====================================================================
-- HackerRank SQL — таблицы из различных задач раздела SQL
-- Схема: hac
-- Для каждой таблицы: DROP TABLE IF EXISTS + CREATE TABLE
-- =====================================================================

CREATE SCHEMA IF NOT EXISTS hac;

-- ---------------------------------------------------------------------
-- Basic Select: "Weather Observation Station" / "African Cities"
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS hac.city;
CREATE TABLE hac.city (
    id           INT PRIMARY KEY,
    name         VARCHAR(255) NOT NULL,
    countrycode  CHAR(3)      NOT NULL,
    district     VARCHAR(255),
    population   INT
);

DROP TABLE IF EXISTS hac.country;
CREATE TABLE hac.country (
    code            CHAR(3)      PRIMARY KEY,
    name            VARCHAR(255) NOT NULL,
    continent       VARCHAR(50),
    region          VARCHAR(50),
    surfacearea     DECIMAL(15,2),
    indepyear       SMALLINT,
    population      INT,
    lifeexpectancy  DECIMAL(5,1),
    gnp             DECIMAL(15,2),
    gnpold          DECIMAL(15,2),
    localname       VARCHAR(255),
    governmentform  VARCHAR(255),
    headofstate     VARCHAR(255),
    capital         INT,
    code2           CHAR(2)
);

DROP TABLE IF EXISTS hac.station;
CREATE TABLE hac.station (
    id      INT PRIMARY KEY,
    city    VARCHAR(21) NOT NULL,
    state   VARCHAR(2)  NOT NULL,
    lat_n   DECIMAL(10,8),
    long_w  DECIMAL(10,8)
);

-- ---------------------------------------------------------------------
-- Advanced Select: "Type of Triangle" / "Binary Tree Nodes"
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS hac.triangles;
CREATE TABLE hac.triangles (
    a INT NOT NULL,
    b INT NOT NULL,
    c INT NOT NULL
);

DROP TABLE IF EXISTS hac.bst;
CREATE TABLE hac.bst (
    n int PRIMARY KEY,
    p int
);

-- ---------------------------------------------------------------------
-- Aggregation: "Pivot" / "Weighted Mean"
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS hac.occupations;
CREATE TABLE hac.occupations (
    name        VARCHAR(255) NOT NULL,
    occupation  VARCHAR(50)  NOT NULL
        CHECK (occupation IN ('Doctor','Professor','Singer','Actor'))
);

DROP TABLE IF EXISTS hac.employee;
CREATE TABLE hac.employee (
    employee_id INT PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    months      INT NOT NULL,
    salary      INT NOT NULL
);

-- ---------------------------------------------------------------------
-- Basic Join: "Students / Higher Than 75 Marks" / "The Report"
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS hac.students;
CREATE TABLE hac.students (
    id     INT PRIMARY KEY,
    name   VARCHAR(60) NOT NULL,
    marks  INT NOT NULL
);

DROP TABLE IF EXISTS hac.grades;
CREATE TABLE hac.grades (
    grade_id  INT PRIMARY KEY,
    min_mark  INT NOT NULL,
    max_mark  INT NOT NULL
);

-- ---------------------------------------------------------------------
-- Basic Join: "SQL Project Planning"
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS hac.projects;
CREATE TABLE hac.projects (
    task_id     INT PRIMARY KEY,
    start_date  DATE NOT NULL,
    end_date    DATE NOT NULL
);

-- ---------------------------------------------------------------------
-- Advanced Join: "Placements"
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS hac.friends;
CREATE TABLE hac.friends (
    id         INT PRIMARY KEY,
    friend_id  INT NOT NULL
);

DROP TABLE IF EXISTS hac.packages;
CREATE TABLE hac.packages (
    id      INT PRIMARY KEY,
    salary  DECIMAL(10,2) NOT NULL
);

-- ---------------------------------------------------------------------
-- Advanced Join: "Ollivander's Inventory"
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS hac.wands;
CREATE TABLE hac.wands (
    id            INT NOT NULL,
    code          VARCHAR(10) NOT NULL,
    coins_needed  INT NOT NULL,
    power         INT NOT NULL
);

DROP TABLE IF EXISTS hac.wands_property;
CREATE TABLE hac.wands_property (
    code     VARCHAR(10) NOT NULL,
    age      INT NOT NULL,
    is_evil  INT NOT NULL
);

-- ---------------------------------------------------------------------
-- Advanced Join: "New Companies"
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS hac.company;
CREATE TABLE hac.company (
    company_code  VARCHAR(10) PRIMARY KEY,
    founder       VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS hac.lead_manager;
CREATE TABLE hac.lead_manager (
    lead_manager_code  VARCHAR(10) PRIMARY KEY,
    company_code       VARCHAR(10) NOT NULL,
    lead_manager_name  VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS hac.senior_manager;
CREATE TABLE hac.senior_manager (
    senior_manager_code  VARCHAR(10) PRIMARY KEY,
    lead_manager_code    VARCHAR(10) NOT NULL,
    company_code         VARCHAR(10) NOT NULL,
    senior_manager_name  VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS hac.manager;
CREATE TABLE hac.manager (
    manager_code         VARCHAR(10) PRIMARY KEY,
    senior_manager_code  VARCHAR(10) NOT NULL,
    lead_manager_code    VARCHAR(10) NOT NULL,
    company_code         VARCHAR(10) NOT NULL,
    manager_name         VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS hac.employee_hierarchy;
CREATE TABLE hac.employee_hierarchy (
    employee_code   VARCHAR(10) PRIMARY KEY,
    manager_code    VARCHAR(10) NOT NULL,
    senior_manager_code VARCHAR(10) NOT NULL,
    lead_manager_code   VARCHAR(10) NOT NULL,
    company_code    VARCHAR(10) NOT NULL,
    employee_name   VARCHAR(255) NOT NULL
);

-- ---------------------------------------------------------------------
-- Alternative Queries / Contests: "Contest Leaderboard"
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS hac.contests;
CREATE TABLE hac.contests (
    contest_id       INT PRIMARY KEY,
    hacker_id        INT NOT NULL,
    name             VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS hac.colleges;
CREATE TABLE hac.colleges (
    college_id   INT PRIMARY KEY,
    contest_id   INT NOT NULL
);

DROP TABLE IF EXISTS hac.challenges;
CREATE TABLE hac.challenges (
    challenge_id  INT PRIMARY KEY,
    hacker_id     INT NOT NULL,
    college_id    INT NOT NULL
);

DROP TABLE IF EXISTS hac.view_stats;
CREATE TABLE hac.view_stats (
    challenge_id  INT NOT NULL,
    total_views   INT NOT NULL,
    total_unique_views  INT NOT NULL
);

DROP TABLE IF EXISTS hac.submission_stats;
CREATE TABLE hac.submission_stats (
    challenge_id           INT NOT NULL,
    total_submissions      INT NOT NULL,
    total_accepted_submissions  INT NOT NULL
);

-- ---------------------------------------------------------------------
-- 30 Days of SQL: "Hackers / Submissions / Difficulty"
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS hac.hackers;
CREATE TABLE hac.hackers (
    hacker_id  INT PRIMARY KEY,
    name       VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS hac.difficulty;
CREATE TABLE hac.difficulty (
    difficulty_level  INT PRIMARY KEY,
    score             INT NOT NULL
);

DROP TABLE IF EXISTS hac.submissions;
CREATE TABLE hac.submissions (
    submission_date  DATE NOT NULL,
    submission_id    INT PRIMARY KEY,
    hacker_id        INT NOT NULL,
    score            INT NOT NULL
);
