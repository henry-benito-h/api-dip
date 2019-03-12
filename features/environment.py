import yaml
from utils.request_manager import Request


global config
config = yaml.load(open('configuration/config.yml'))


def before_all(context):
    context.config = config
    context.request = Request(config['root'])


def after_feature(context, feature):
    context.request.reset_credentials()
