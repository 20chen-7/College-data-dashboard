import pyarrow as pa
import pyarrow.parquet as pq
import os
if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "/home/src/de-bootcamp-final-project-2b553bee6e98.json"

bucket_name = 'college-scorecard-data-2024-04'
project_id = 'de-bootcamp-final-project'
table_name = 'college_data_study_1819_1920'
root_path = f'{bucket_name}/{table_name}'


@data_exporter
def export_data(data, *args, **kwargs):

    table = pa.Table.from_pandas(data)

    gcs = pa.fs.GcsFileSystem()

    pq.write_to_dataset(
        table,
        root_path = root_path,
        partition_cols = ['DISTANCE'],
        filesystem = gcs
    )
