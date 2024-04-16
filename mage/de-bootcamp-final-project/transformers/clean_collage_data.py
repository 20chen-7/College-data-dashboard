import numpy as np
if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    """
    Template code for a transformer block.

    Add more parameters to this function if this block has multiple parent blocks.
    There should be one parameter for each output variable from each parent block.

    Args:
        data: The output from the upstream parent block
        args: The output from any additional upstream blocks (if applicable)

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    # Specify your transformation logic here
    mask = (data == 'PrivacySuppressed').any(axis=0) 
    data = data.loc[:, ~mask]
    return data[data['UNITID'] > 0].dropna(axis=1)


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output['UNITID'].isin([0]).sum() == 0, 'The UNITID contains invalid value'
    assert not output.isnull().all(axis=0).any(), "There are fully null columns in the output"
