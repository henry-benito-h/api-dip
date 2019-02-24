# Created by Jafeth Garcia at 2/23/2019
import json
from compare import expect
from behave import *

use_step_matcher("re")


@then(u'I store the id of the resource')
def step_impl(context):
    context.resource_id = context.response.json()['id']


@then(u'I should see the list of resources on the collection')
def step_impl(context):
    result = context.response.json()
    expect(result).to_be_truthy()