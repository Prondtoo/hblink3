FROM python:3.9-alpine

COPY entrypoint /entrypoint

RUN adduser -D -u 54000 radio && \
        apk update && \
        apk add gcc musl-dev

COPY . /opt/hblink3

RUN cd /opt/hblink3 && \
        pip install --no-cache-dir -r requirements.txt && \
        apk del gcc musl-dev && \
        chown -R radio: /opt/hblink3

USER radio

ENTRYPOINT [ "/entrypoint" ]
