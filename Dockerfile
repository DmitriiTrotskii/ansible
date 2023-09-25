FROM alpine:3.18

LABEL mainteiner="Dmitrii Trotskii"
LABEL email="dmitrii.trotskii@gmail.com"
LABEL function="Ansible with kerberos authentification for psrp"

RUN apk add --no-cache --update \
    ansible \
    curl \
    gcc \
    git \
    krb5 \
    krb5-dev \
    krb5-libs \
    musl-dev \
    openssh-client \
    python3 \
    python3-dev \
    sshpass

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    pip install pypsrp && \
    pip install pypsrp[kerberos] && \
    rm -rf get-pip.py
