from utils.random_resources import *


def replace_parameters(context, text, edit_mode=False):
    parameters = {
        ":my_account_id": context.my_id if hasattr(context, 'my_id') else None,
        ":randomName": context.random_name if not edit_mode else context.random_name = random_string(20),
    }
    for key in parameters.keys():
        text = text.replace(key, str(parameters[key]))
    return text
