# Author: Naira Romero

import json
from compare import expect
from behave import *


@then(u'I should have a new course with name equals to \'course_tes1\'')
def step_impl(context):
    body = json.loads(context.req_body)
    result = context.response.json()
    # expect(result.text).to_equal('"El c\\u00f3digo de curso que introdujo ya existe."')
    expect(result).to_be_truthy()
    expect(result['title']).to_equal(body['title'])


@then(u'I should not be enable to create a new course because the required fields empty')
def step_impl(context):
    result = context.response
    expect(result.text).to_equal('"The course name and course code fields are required and cannot be blank."')
    result = context.response.json()
    expect(result).to_be_truthy()
