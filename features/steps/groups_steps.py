import json
from compare import expect
from behave import *


@then(u'I store the id of the group')
def step_impl(context):
    context.id = context.response.json()['id']


@then(u'I should see the group created matching with the one created')
def step_impl(context):
    body = json.loads(context.req_body)
    result = context.response.json()

    expect(result['title']).to_equal(body['title'])
    expect(result['id']).to_equal(context.id)

@then(u'I should see the list of events on the group')
def step_impl(context):
    result = context.response.json()
    expect(result).to_be_truthy()


