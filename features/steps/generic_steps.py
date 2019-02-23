import json
from compare import expect
from behave import use_step_matcher, when


use_step_matcher("re")


@given(u'I have this endpoint "(?P<endpoint>.*)"')
def step_impl(context, endpoint):
    context.endpoint = endpoint


@given(u'I have a record already created')
def step_impl(context):
    pass


@when(u'I do a (?P<action>GET|POST|PUT|DELETE) request')
def step_impl(context, action):
    pass


@when(u'that request has (?P<data_type>.*)?values in data')
def step_impl(context, data_type):
    context.text = json.loads(context.text)
    pass


@then(u'I should have (?P<status_code>.*) as status code')
def step_impl(context, status_code):
    pass


@then(u'for response body I should get a record info')
def step_impl(context):
    context.text = json.loads(context.text)
