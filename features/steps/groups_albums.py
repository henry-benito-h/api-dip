#Author: Naira Romero

import json
from compare import expect
@then(u'The response body should have an title equals to one created')
def step_impl(context):
    body = json.loads(context.req_body)
    result = context.response.json()

    expect(result['title']).to_equal(body['title'])

@then(u'I should not be enable to create a new album because the required fields empty')
def step_impl(context):
    result = context.response
    expect(result.text).to_equal('"The media album title is required and cannot be blank."')



#For albums
@then(u'I store the id of an Album')
def step_impl(context):
    context.id = context.response.json()['id']


@then(u'I should see the info of the album created matching with the one created')
def step_impl(context):
    body = json.loads(context.req_body)
    result = context.response.json()

    expect(result['title']).to_equal(body['title'])
    expect(result['id']).to_equal(context.id)
