from mage_ai.io.file import FileIO
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

@data_loader
def load_data_from_api(*args, **kwargs):
    """
    Template for loading data from API
    """
#     desired_files = [
#     'data/FieldOfStudyData1415_1516_PP.csv'
#     'data/FieldOfStudyData1516_1617_PP.csv'
#     'data/FieldOfStudyData1617_1718_PP.csv'
#     'data/FieldOfStudyData1718_1819_PP.csv'
#     'data/FieldOfStudyData1819_1920_PP.csv'
# ]           
    # desired_file = 'data/FieldOfStudyData1516_1617_PP.csv'
    # with zipfile.ZipFile(zip_file_bytes) as zip_file:
    #     with zip_file.open(desired_file) as file:
    #         df_merged = pd.read_csv(file, dtype=college_dtypes)
    # df = pd.read_csv(file, dtype=college_dtypes)
    filepath = '/home/src/de-bootcamp-final-project/dataset/MERGED2019_20_PP.parquet'
    return  FileIO().load(filepath)


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'

