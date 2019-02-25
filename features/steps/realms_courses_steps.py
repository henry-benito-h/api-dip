from compare import expect


@then(u'I should have a new course with name equals to \'course_tes1\'')
def step_impl(context):
    result = context.response
    expect(result.text).to_equal('"El c\\u00f3digo de curso que introdujo ya existe."')
