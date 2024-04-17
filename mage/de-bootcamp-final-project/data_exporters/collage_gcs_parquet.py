from mage_ai.settings.repo import get_repo_path
from mage_ai.io.config import ConfigFileLoader
from mage_ai.io.google_cloud_storage import GoogleCloudStorage
from pandas import DataFrame
from os import path

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

@data_exporter
def export_data_to_big_query(df: DataFrame, **kwargs) -> None:
    """
    Template for exporting data to a BigQuery warehouse.
    Specify your configuration settings in 'io_config.yaml'.

    Docs: https://docs.mage.ai/design/data-loading#bigquery
    """
    config_path = path.join(get_repo_path(), 'io_config.yaml')
    config_profile = 'default'

    bucket_name = 'college-scorecard-data-2024-04'
#     desired_files = [
#     
#     'FieldOfStudyData1415_1516_PP.parquet',
#     'FieldOfStudyData1516_1617_PP.parquet',
#     'FieldOfStudyData1617_1718_PP.parquet',
#     'FieldOfStudyData1718_1819_PP.parquet',
#   '  FieldOfStudyData1819_1920_PP.parquet',
# ]
    object_key = 'FieldOfStudyData1415_1516_PP.parquet'

    GoogleCloudStorage.with_config(ConfigFileLoader(config_path, config_profile)).export(
        df,
        bucket_name,
        object_key,
    )