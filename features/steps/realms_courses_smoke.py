import json
from compare import expect


@given(u'I have the data below')
def step_impl(context):
    context.course_payload = json.loads(context.text)


@when(u'I do an api {post} request')
def step_impl(context, post):
    result = context.request.call(post, context.endpoint, data=context.course_payload)
    expect(result.status_code).to_equal(200)

@then(u'I should have a new course with name equals to \'course_tes1\'')
def step_impl(context):
    raise NotImplementedError(u'STEP: Then I should have a new course with name equals to \'course_tes1\'')
