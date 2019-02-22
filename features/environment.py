import yaml


global config
config = yaml.load(open('configuration/config.yml'))


def before_all(context):
    context.config = config
    context.api_url = config['host'] + config['root_path']
    consumer_key = config['consumer_key']
    consumer_secret = config['consumer_secret']
    context.auth_header = 'OAuth ' \
                          f'oauth_consumer_key="{consumer_key}", ' \
                          'oauth_signature_method="HMAC-SHA1", ' \
                          'oauth_timestamp="1550794402", ' \
                          'oauth_nonce="705p0U3tiOa", ' \
                          'oauth_version="1.0",' \
                          f'oauth_signature="Ft7rFulm8NF6ozQSRMUpklz4d04%3D"'
