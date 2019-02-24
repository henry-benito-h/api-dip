import json
from compare import expect, ensure
from behave import *


use_step_matcher("re")


@given(u'I have the next endpoint "(?P<endpoint>.*)"')
def step_impl(context, endpoint):
    if ':id' in endpoint and hasattr(context, 'id'):
        endpoint = endpoint.replace(':id', str(context.id))
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


@then("response body should match with (?P<content>.*)?content")
def step_impl(context, content):
    content = content.rstrip()
    if content == "empty" and context.text:
        ensure(False, True, "If we are waiting 'empty content' should not exist a text below the step")

    if context.text is None:
        expect("").to_equal(context.response.text)

    if context.text:
        try:
            current = context.response.json()
            if content:
                current = current[content][0]
            expected = json.loads(context.text)

            for key in expected:
                expect(expected[key]).to_equal(current[key])
        except KeyError:
            ensure(False, True, "This key '{}' does not exist for both dicts".format(key))


@step("I have a record already created with this content")
def step_impl(context):
    params = context.req_params if hasattr(context, 'req_params') else None
    request_response = context.request.call('POST', context.endpoint, data=context.text, params=params)
    context.id = request_response.json()["id"]


@given('I am authenticated as "(?P<credentials>.*)"')
def step_impl(context, credentials):
    try:
        context.request.update_credentials(credentials)
    except KeyError:
        ensure(False, True, "Wrong credential value. Key '{}' does not exist".format(credentials))

