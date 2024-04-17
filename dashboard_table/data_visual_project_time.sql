
CREATE TABLE de-bootcamp-final-project.college_data_all.study_table_2015 AS
SELECT 
    *,
    2015 AS year
FROM 
    `de-bootcamp-final-project.college_data_all.studydata_15`;


CREATE TABLE de-bootcamp-final-project.college_data_all.study_table_2016 AS
SELECT 
    *,
    2016 AS year
FROM 
    `de-bootcamp-final-project.college_data_all.studydata_16`;

CREATE TABLE de-bootcamp-final-project.college_data_all.study_table_2017 AS
SELECT 
    *,
    2017 AS year
FROM 
    `de-bootcamp-final-project.college_data_all.studydata_17`;

CREATE TABLE de-bootcamp-final-project.college_data_all.study_table_2018 AS
SELECT 
    *,
    2018 AS year
FROM 
    `de-bootcamp-final-project.college_data_all.studydata_18`;

CREATE TABLE de-bootcamp-final-project.college_data_all.study_table_2019 AS
SELECT 
    *,
    2019 AS year
FROM 
    `de-bootcamp-final-project.college_data_all.studydata_1920`;


SELECT 
  UNITID, 
  COUNT(*) AS records_cnt_2015,
  2015 AS year
FROM college_data_all.study_table_2015
GROUP BY UNITID
ORDER BY records_cnt_2015 DESC;

SELECT 
  DISTINCT(UNITID), 
  COUNT(*) AS records_cnt_2016,
  year
FROM college_data_all.study_table_2016
GROUP BY UNITID
ORDER BY records_cnt_2016;

SELECT 
  DISTINCT(UNITID), 
  COUNT(*) AS records_cnt_2017,
  year
FROM college_data_all.study_table_2017
GROUP BY UNITID
ORDER BY records_cnt_2017;

SELECT 
  DISTINCT(UNITID), 
  COUNT(*) AS records_cnt_2018,
  year
FROM college_data_all.study_table_2018
GROUP BY UNITID
ORDER BY records_cnt_2018;

SELECT 
  DISTINCT(UNITID), 
  COUNT(*) AS records_cnt_2019,
  year
FROM college_data_all.study_table_2019
GROUP BY UNITID
ORDER BY records_cnt_2019;

CREATE TABLE college_data_all.state_yearly_record_counts AS
SELECT 
    m.stabbr, 
    DATE(CONCAT(CAST(y.year AS STRING), '-01-01')) AS year_date,
    COUNT(*) AS records_count
FROM (
    SELECT unitid, 2015 AS year FROM college_data_all.study_table_2015
    UNION ALL
    SELECT unitid, 2016 AS year FROM college_data_all.study_table_2016
    UNION ALL
    SELECT unitid, 2017 AS year FROM college_data_all.study_table_2017
    UNION ALL
    SELECT unitid, 2018 AS year FROM college_data_all.study_table_2018
    UNION ALL
    SELECT unitid, 2019 AS year FROM college_data_all.study_table_2019
) y
JOIN college_data_all.merged_data_1920 m ON y.unitid = m.unitid
GROUP BY 
    m.stabbr, y.year
ORDER BY 
    m.stabbr, year_date;
