#!/usr/bin/env bash
set -Eeo pipefail

if [[ -z "${UOJ_PROTOCOL}" ]]; then
    sed -i -e "s/UOJ_PROTOCOL/http/g" /opt/uoj/judger/.conf.json
else
    sed -i -e "s/UOJ_PROTOCOL/${UOJ_PROTOCOL}/g" /opt/uoj/judger/.conf.json
fi

if [[ -z "${UOJ_HOST}" ]]; then
    sed -i -e "s/UOJ_HOST/127.0.0.1/g" /opt/uoj/judger/.conf.json
else
    sed -i -e "s/UOJ_HOST/${UOJ_HOST}/g" /opt/uoj/judger/.conf.json
fi

if [[ -z "${UOJ_JUDGER_NAME}" ]]; then
    sed -i -e "s/UOJ_JUDGER_NAME/main_judger/g" /opt/uoj/judger/.conf.json
else
    sed -i -e "s/UOJ_JUDGER_NAME/${UOJ_JUDGER_NAME}/g" /opt/uoj/judger/.conf.json
fi

if [[ -z "${UOJ_JUDGER_PASSWORD}" ]]; then
    sed -i -e "s/UOJ_JUDGER_PASSWORD/_main_judger_password_/g" /opt/uoj/judger/.conf.json
else
    sed -i -e "s/UOJ_JUDGER_PASSWORD/${UOJ_JUDGER_PASSWORD}/g" /opt/uoj/judger/.conf.json
fi

if [[ -z "${UOJ_SOCKET_PORT}" ]]; then
    sed -i -e "s/UOJ_SOCKET_PORT/2333/g" /opt/uoj/judger/.conf.json
else
    sed -i -e "s/UOJ_SOCKET_PORT/${UOJ_SOCKET_PORT}/g" /opt/uoj/judger/.conf.json
fi

if [[ -z "${UOJ_SOCKET_PASSWORD}" ]]; then
    sed -i -e "s/UOJ_SOCKET_PASSWORD/_judger_socket_password_/g" /opt/uoj/judger/.conf.json
else
    sed -i -e "s/UOJ_SOCKET_PASSWORD/${UOJ_SOCKET_PASSWORD}/g" /opt/uoj/judger/.conf.json
fi


exec "$@"
