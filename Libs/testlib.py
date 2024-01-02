import json
import urllib.parse


def encode_url(url):
    return urllib.parse.urlencode(url)


def load_json_from_json_string(json_string):
    return json.loads(json_string)


def dump_json(json_object):
    jsn = json.dumps(json_object)
    return jsn


def create_json_using_dictionary(dict):
    jsn = json.dumps(dict)
    return jsn
