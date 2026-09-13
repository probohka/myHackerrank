-- =====================================================================
-- HackerRank SQL — импорт данных из CSV в таблицы схемы hac
-- Выполняется автоматически после 01_create_tables.sql
-- (docker-entrypoint-initdb.d запускает файлы по алфавиту)
--
-- ВАЖНО: путь /var/lib/postgresql/csv — это путь ВНУТРИ контейнера
-- (см. Dockerfile: COPY csv /var/lib/postgresql/csv)
--
-- Ниже предполагается, что имя CSV-файла = имя таблицы,
-- а порядок колонок в CSV совпадает с порядком в CREATE TABLE.
-- Если это не так — поправьте список колонок в скобках после
-- имени таблицы под порядок колонок в конкретном CSV.
--
-- Если для какой-то таблицы CSV-файла ещё нет — закомментируйте
-- соответствующий блок COPY (иначе скрипт упадёт с ошибкой "no such file").
-- =====================================================================

COPY hac.city (id, name, countrycode, district, population)
FROM '/var/lib/postgresql/csv/city.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.triangles (a, b, c)
FROM '/var/lib/postgresql/csv/triangles.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.country (code, name, continent, region, surfacearea, indepyear,
                   population, lifeexpectancy, gnp, gnpold, localname,
                   governmentform, headofstate, capital, code2)
FROM '/var/lib/postgresql/csv/country.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.station (id, city, state, lat_n, long_w)
FROM '/var/lib/postgresql/csv/station.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.bst (n, p)
FROM '/var/lib/postgresql/csv/bst.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.occupations (name, occupation)
FROM '/var/lib/postgresql/csv/occupations.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.employee (employee_id, name, months, salary)
FROM '/var/lib/postgresql/csv/employee.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.students (id, name, marks)
FROM '/var/lib/postgresql/csv/students.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.grades (grade_id, min_mark, max_mark)
FROM '/var/lib/postgresql/csv/grades.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.projects (task_id, start_date, end_date)
FROM '/var/lib/postgresql/csv/projects.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.friends (id, friend_id)
FROM '/var/lib/postgresql/csv/friends.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.packages (id, salary)
FROM '/var/lib/postgresql/csv/packages.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.wands (id, code, coins_needed, power)
FROM '/var/lib/postgresql/csv/wands.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.wands_property (code, age, is_evil)
FROM '/var/lib/postgresql/csv/wands_property.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.company (company_code, founder)
FROM '/var/lib/postgresql/csv/company.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.lead_manager (lead_manager_code, company_code)
FROM '/var/lib/postgresql/csv/lead_manager.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.senior_manager (senior_manager_code, lead_manager_code,
                          company_code)
FROM '/var/lib/postgresql/csv/senior_manager.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.manager (manager_code, senior_manager_code, lead_manager_code,
                   company_code)
FROM '/var/lib/postgresql/csv/manager.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.employee_hierarchy (employee_code, manager_code, senior_manager_code,
                              lead_manager_code, company_code)
FROM '/var/lib/postgresql/csv/employee_hierarchy.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.contests (contest_id, hacker_id, name)
FROM '/var/lib/postgresql/csv/contests.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.colleges (college_id, contest_id)
FROM '/var/lib/postgresql/csv/colleges.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.challenges (challenge_id, hacker_id, college_id)
FROM '/var/lib/postgresql/csv/challenges.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.view_stats (challenge_id, total_views, total_unique_views)
FROM '/var/lib/postgresql/csv/view_stats.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.submission_stats (challenge_id, total_submissions,
                            total_accepted_submissions)
FROM '/var/lib/postgresql/csv/submission_stats.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.hackers (hacker_id, name)
FROM '/var/lib/postgresql/csv/hackers.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.difficulty (difficulty_level, score)
FROM '/var/lib/postgresql/csv/difficulty.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY hac.submissions (submission_date, submission_id, hacker_id, score)
FROM '/var/lib/postgresql/csv/submissions.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
