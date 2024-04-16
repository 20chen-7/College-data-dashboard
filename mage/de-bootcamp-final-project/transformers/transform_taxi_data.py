if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    # print(f'Preprocessing: rows with zero passengers: {data['passenger_count'].isin([0]).sum()}')
    data['lpep_pickup_date'] = data['lpep_pickup_datetime'].dt.date
    count = 0
    for name in data.columns:
        if str(name) != str(name).lower() and str(name) != str(name).upper() and "_" not in str(name):
            count += 1
    # regex
    # changed_cols_num= sum(data.columns
    #     .str.match(r'[A-Z]+[a-z]+[A-Z]+')
    # )
    # test = sum(changed_cols)
    data.columns= (data.columns
        .str.replace(r'([a-z])([A-Z])', r'\1_\2', regex=True)
        .str.lower()
    )
    print(f'Preprocessing: columns with Camel Case to Snake Case: {count}')
    return data[(data['passenger_count'] > 0) & (data['trip_distance'] > 0)] 
    # return data


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output['passenger_count'].isin([0]).sum() == 0, "There are rides with zero passenger."
