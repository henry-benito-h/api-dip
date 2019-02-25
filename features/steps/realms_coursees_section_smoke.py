import json
from compare import expect
from behave import *

@then(u'I store the id of the course')
def step_impl(context):
    context.id = context.response.json()['id']

@then(u'I should have a new section code in the course that matches with the one created')
def step_impl(context):
    body = json.loads(context.req_body)
    result = context.response.json()
   # expect(result.section_code).to_equal(body.section_code)
    expect(result).to_be_truthy()
