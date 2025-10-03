import json
import os
import urllib.request
import logging
from inspect import Parameter

import psycopg2


def lambda_handler(event, context):
    logger = logging.getLogger()
    if os.environ['ENVIRONMENT'] == 'dev':
        logger.setLevel(logging.DEBUG)
    else:
        logger.setLevel(logging.INFO)
    logger.info(json.dumps(event, indent=2))

    database_host = get_parameter('dbhost')['Parameter']['Value']
    logger.debug(f"database_host = {database_host}")
    database_user = get_parameter('dbuser')['Parameter']['Value']
    logger.debug(f"database_user = {database_user}")
    database_name = get_parameter('dbname')['Parameter']['Value']
    logger.debug(f"database_name = {database_name}")
    database_pass = get_parameter('dbpasswd')['Parameter']['Value']

    # Now connect to the DB
    dsn = f"dbname='{database_name}' user='{database_user}' password='{database_pass}' host='{database_host}'"

    conn = psycopg2.connect(dsn=dsn)
    cur = conn.cursor()

    cur.execute('SELECT COUNT(country_code_3) FROM country')
    res = cur.fetchone()

    return json.loads(f'{{"resultCode": 200, "resultMessage": "OK", "count": {res[0]}}}')


def get_parameter(parameter_name):
    aws_session_token = os.environ['AWS_SESSION_TOKEN']

    req = urllib.request.Request(f'http://localhost:2773/systemsmanager/parameters/get?name=%2F{os.environ.get("PROJECT")}%2F{os.environ.get("VERSION")}%2F{os.environ.get("ENVIRONMENT")}%2F{parameter_name}&withDecryption=true')
    req.add_header('X-Aws-Parameters-Secrets-Token', aws_session_token)
    result = urllib.request.urlopen(req).read()
    return json.loads(result)