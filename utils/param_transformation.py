def replace_parameters(context, text):
    parameters = {
        ":my_id": context.my_id,
        ":random_user_id": context.random_user_id
    }
    for key in parameters.keys():
        text = text.replace(key, str(parameters[key]))
    return text
