import json
from compare import expect
from behave import use_step_matcher, when, then, given

use_step_matcher("re")


@given(u'I have this endpoint "(?P<endpoint>.*)"')
def step_impl(context, endpoint):
    context.endpoint = endpoint


@given(u'I have a record already created')
def step_impl(context):
    pass


@when(u'I do a (?P<action>GET|POST|PUT|DELETE|PATCH) request')
def step_impl(context, action):
    context.action = action


@when(u'that request has (?P<data_type>.*)?values in data')
def step_impl(context, data_type):
    context.text = json.loads(context.text)
    result = context.request.call(context.action, context.endpoint)
    context.request_body = result.json()
    context.request_code = result.status_code


@then(u'I should have (?P<expected_code>[1-5]\d{2}) as status code')
def step_impl(context, expected_code):
    expect(context.request_code).to_equal(int(expected_code))


@then(u'for response body I should get a record info')
def step_impl(context):
    context.expected_body = json.loads(context.text)
    expect(context.expected_body).to_equal(context.request_body)

