import requests
from requests_oauthlib import OAuth1


class Request:
    """Class client for schoology api service"""
    def __init__(self, config):
        self.base_url = f'{config["host"]}{config["root_path"]}'
        self.auth = OAuth1(config['consumer_key'], config['consumer_secret'])
        self.headers = {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Host': 'api.schoology.com'
        }

    def call(self, method, end_point, **kwargs):
        url = f'{self.base_url}{end_point}'
        return requests.request(method, url, **kwargs)

    def get(self, end_point, **kwargs):
        return self.call('get', end_point, **kwargs)

    def post(self, end_point, data=None, **kwargs):
        return self.call('post', end_point, data=data, **kwargs)

    def put(self, end_point, data=None, **kwargs):
        return self.call('put', end_point, data=data, **kwargs)

    def patch(self, end_point, data=None, **kwargs):
        return self.call('patch', end_point, data=data, **kwargs)

    def delete(self, end_point, **kwargs):
        return self.call('delete', end_point, **kwargs)
