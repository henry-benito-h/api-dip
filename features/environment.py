import yaml
from utils.request_manager import Request


global config
config = yaml.load(open('configuration/config.yml'))


def before_all(context):
    print(config)
    context.config = config
    context.request = Request(config['authentication'])


def after_feature(context,feature):
    context.request.reset_credentials()
