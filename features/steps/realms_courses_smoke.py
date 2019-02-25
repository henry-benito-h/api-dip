import json
from compare import expect


@then(u'I should have a new course with name equals to \'course_tes1\'')
def step_impl(context):
    body = json.loads(context.req_body)
    result = context.response.json()
    #expect(result.text).to_equal('"El c\\u00f3digo de curso que introdujo ya existe."')
    expect(result).to_be_truthy()
    expect(result['title']).to_equal(body['title'])


