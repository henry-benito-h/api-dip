from compare import expect


@given(u'I am authentication on schoology with username pepe and password pepepass')
def step_impl(context):
    """ Using request get, need to add just the endpoint"""
    r = context.request.get('/groups')
    print('status from groups is', r.status_code)
    expect(r.status_code).to_equal(200)


@then(u'I am logger into schoology')
def step_impl(context):
    """ Using request call, need to add the method
    (GET, POST, PU, PATCH, DELETE) and the endpoint"""
    r = context.request.call('GET', '/groups')
    print('Status from groups is: ', r.status_code)
    expect(r.status_code).to_equal(200)
