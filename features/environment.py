import yaml


global config
config = yaml.load(open('configuration/config.yml'))


def before_all(context):
    context.config = config
