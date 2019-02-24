# Created by Jafeth Garcia at 2/23/2019
import json
from compare import expect


@then(u'I store the id of the collection')
def step_impl(context):
    context.id = context.response.json()['id']


@then(u'The response body should have an id')
def step_impl(context):
    result = context.response.json()
    expect(result).to_be_truthy()
    expect(result['id']).to_be_truthy()


@then(u'I should see the collection created matching with the one created')
def step_impl(context):
    body = json.loads(context.req_body)
    result = context.response.json()

    expect(result['title']).to_equal(body['title'])
    expect(result['id']).to_equal(context.id)

