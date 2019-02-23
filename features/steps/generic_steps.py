import json
from compare import expect
from behave import *


use_step_matcher("re")


@given(u'I have the next endpoint "(?P<endpoint>.*)"')
def step_impl(context, endpoint):
    context.endpoint = endpoint


@given(u'I have the body payload below')
def step_impl(context):
    context.req_body = json.dumps(json.loads(context.text))


@when(u'I do an api (?P<method>GET|POST|PUT|DELETE) request')
def step_impl(context, method):
    data = context.req_body if hasattr(context, 'req_body') else None
    params = context.req_params if hasattr(context, 'req_params') else None
    context.response = context.request.call(method, context.endpoint, data=data, params=params)


@then(u'I should have (?P<status_code>.*) as status code')
def step_impl(context, status_code):
    expect(context.response.status_code).to_equal(int(status_code))
