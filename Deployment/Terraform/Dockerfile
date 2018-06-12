FROM hashicorp/terraform:light

RUN apk update && \
    apk add bash py-pip && \
    apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make && \
    pip install azure-cli && \
    apk del --purge build 

ADD ./terProviders.tf /app/pre_install/main.tf
RUN cd /app/pre_install && \
    ls /app/pre_install && \
    terraform init

COPY ./app /app

WORKDIR /app

ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]