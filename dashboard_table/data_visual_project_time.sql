
CREATE TABLE de-bootcamp-final-project.college_data_all.study_table_2015 AS
SELECT 
    *,
    2015 AS year
FROM 
    `de-bootcamp-final-project.college_dataset_ivy.studydata_15`;


CREATE TABLE de-bootcamp-final-project.college_dataset_ivy.study_table_2016 AS
SELECT 
    *,
    2016 AS year
FROM 
    `de-bootcamp-final-project.college_dataset_ivy.studydata_16`;

CREATE TABLE de-bootcamp-final-project.college_dataset_ivy.study_table_2017 AS
SELECT 
    *,
    2017 AS year
FROM 
    `de-bootcamp-final-project.college_dataset_ivy.studydata_17`;

CREATE TABLE de-bootcamp-final-project.college_dataset_ivy.study_table_2018 AS
SELECT 
    *,
    2018 AS year
FROM 
    `de-bootcamp-final-project.college_dataset_ivy.studydata_18`;

CREATE TABLE de-bootcamp-final-project.college_dataset_ivy.study_table_2019 AS
SELECT 
    *,
    2019 AS year
FROM 
    `de-bootcamp-final-project.college_dataset_ivy.studydata_1920`;


CREATE TABLE college_dataset_ivy.state_yearly_record_counts AS
SELECT 
    m.stabbr, 
    DATE(CONCAT(CAST(y.year AS STRING), '-01-01')) AS year_date,
    COUNT(*) AS records_count
FROM (
    SELECT unitid, 2015 AS year FROM college_dataset_ivy.study_table_2015
    UNION ALL
    SELECT unitid, 2016 AS year FROM college_dataset_ivy.study_table_2016
    UNION ALL
    SELECT unitid, 2017 AS year FROM college_dataset_ivy.study_table_2017
    UNION ALL
    SELECT unitid, 2018 AS year FROM college_dataset_ivy.study_table_2018
    UNION ALL
    SELECT unitid, 2019 AS year FROM college_dataset_ivy.study_table_2019
) y
JOIN college_dataset_ivy.mergedata_19 m ON y.unitid = m.unitid
GROUP BY 
    m.stabbr, y.year
ORDER BY 
    m.stabbr, year_date;
