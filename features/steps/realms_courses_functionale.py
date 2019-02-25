#Author: Naira Romero
import json
from compare import expect
from behave import *

@then(u'I save the id of the course')
def step_impl(context):
    context.id = context.response.json()['id']





