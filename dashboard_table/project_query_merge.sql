SELECT * FROM `de-bootcamp-final-project.college_dataset_ivy.school_data` LIMIT 100;

-- external_table
CREATE OR REPLACE EXTERNAL TABLE de-bootcamp-final-project.college_dataset_ivy.external_school_data
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://college-scorecard-data-2024-04/MERGED2019_20_PP.parquet']
);


--non partitioned table from external table process 4 sec 21.97 MB, 12976 ms
CREATE OR REPLACE TABLE college_dataset_ivy.external_school_data_non_partitioned AS
SELECT * FROM college_dataset_ivy.external_school_data;

--partitioned,6 sec 16427ms, (main -> 3 sec,21.97 MB,6100)( numbranch-> 3 sec, 16288)( st_fips-> 37128)
CREATE OR REPLACE TABLE college_dataset_ivy.external_school_data_partitioned
PARTITION BY RANGE_BUCKET(st_fips, GENERATE_ARRAY(1, 79, 1))
AS
SELECT * FROM college_dataset_ivy.external_school_data;

--104.59 KB,638,main / 84.31 KB,187 numbranch/ 1.52 KB 252  st_fips/
SELECT DISTINCT(UNITID) FROM college_dataset_ivy.external_school_data_partitioned
WHERE st_fips BETWEEN 0 AND 2;

-- -- for external table, 104.59 KB, 96,main/ 89 numbranch/ 104.59 KB, 71, st_fips/
SELECT DISTINCT(UNITID) FROM college_dataset_ivy.external_school_data_non_partitioned
WHERE st_fips BETWEEN 0 AND 2;

-- -- 168 Slot milliseconds
SELECT table_name, partition_id, total_rows 
FROM `college_dataset_ivy.INFORMATION_SCHEMA.PARTITIONS`
WHERE table_name = 'external_school_data_partitioned'
ORDER BY total_rows DESC;
--- cluster 59051 Slot milliseconds
CREATE OR REPLACE TABLE college_dataset_ivy.external_school_data_partitioned_clustered
PARTITION BY RANGE_BUCKET(st_fips, GENERATE_ARRAY(1, 79, 1))
CLUSTER BY UNITID AS
SELECT * FROM college_dataset_ivy.external_school_data;

-- -- 
-- -- partitioned ,1.52 KB 0 sec 197 Slot milliseconds
SELECT COUNT(*) FROM college_dataset_ivy.external_school_data_partitioned_clustered
WHERE st_fips BETWEEN 0 AND 2
  AND UNITID= 175120;


-- -- non cluster,609 Slot milliseconds
SELECT COUNT(*) FROM college_dataset_ivy.external_school_data_partitioned
WHERE st_fips BETWEEN 0 AND 2
  AND UNITID= 175120;

-- -- non partitioned,104.59 KB, 53 Slot milliseconds
SELECT COUNT(*) FROM college_dataset_ivy.external_school_data_non_partitioned
WHERE st_fips BETWEEN 0 AND 2
  AND UNITID= 175120;

