import random

from behave import *

use_step_matcher("re")


@step("I get a random user id from the list")
def step_impl(context):
    users_endpoint = "/users"
    request_response = context.request.call('GET', users_endpoint, data=None, params=None)
    users = request_response.json()["user"]
    random_int = random.randint(0, (len(users) - 1))
    random_user = users[random_int]
    context.random_user_id = random_user["id"]
