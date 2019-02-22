import requests
from requests_oauthlib import OAuth1
from compare import expect


@given(u'I am authentication on schoology with username pepe and password pepepass')
def step_impl(context):
    headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Host': 'api.schoology.com'
    }
    url = f'{context.api_url}/groups'
    auth = OAuth1(context.config['consumer_key'], context.config['consumer_secret'])

    r = requests.get(url, auth=auth, headers=headers)
    expect(r.status_code).to_equal(200)


@then(u'I am logger into schoology')
def step_impl(context):
    pass
