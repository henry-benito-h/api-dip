from utils.random_resources import *


def replace_parameters(context, text):
    parameters = {
        ":my_account_id": "100",
        ":randomName": random_string(20)
    }
    for key in parameters.keys():
        text = text.replace(key, str(parameters[key]))
    return text
