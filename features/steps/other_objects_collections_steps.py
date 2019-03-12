# Created by Jafeth Garcia at 2/23/2019
import json
from compare import expect
from behave import *

use_step_matcher("re")


@then(u'I store the id of the collection')
def step_impl(context):
    context.id = context.response.json()['id']


@then(u'I should see the collection created matching with the one created')
def step_impl(context):
    body = json.loads(context.req_body)
    result = context.response.json()

    expect(result['title']).to_equal(body['title'])
    expect(result['id']).to_equal(context.id)


@then(u'I should see the collection updated')
def step_impl(context):
    body = json.loads(context.req_body)
    result = context.response.json()

    expect(result['title']).to_equal(body['title'])


@then(u'I have the next endpoint "(?P<endpoint>.*)"')
def step_impl(context, endpoint):
    if ':id' in endpoint and hasattr(context, 'id'):
        endpoint = endpoint.replace(':id', str(context.id))
    context.endpoint = endpoint


@then(u'The record should no longer exist')
def step_impl(context):
    result = context.response.json()
    expect(result).to_be_falsy()
