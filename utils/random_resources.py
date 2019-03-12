import random
import string


def random_string(size=20):
    return "".join([random.choice(string.ascii_letters) for i in range(size)])
