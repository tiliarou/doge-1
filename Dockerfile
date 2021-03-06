FROM alpine:latest
RUN mkdir /keys && apk add zlib-dev git python3 python3-dev alpine-sdk libffi-dev musl-dev openssl-dev alpine-sdk jpeg-dev && apk add nodejs --update-cache -X http://dl-3.alpinelinux.org/alpine/edge/main/ --allow-untrusted && pip3 install --upgrade pip && pip3 install colorama pyopenssl requests tqdm unidecode image bs4 urllib3 flask && git clone https://github.com/wowsuchdoge/doge /doge && git clone https://github.com/blawar/nut /doge/nut
COPY files/nut.conf /doge/nut/conf/nut.conf
COPY files/doge.config.json /doge/doge.config.json
COPY files/start_doge.sh /start_doge.sh
COPY files/users.conf /doge/nut/conf/users.conf
EXPOSE 6093
EXPOSE 9000
VOLUME /nsp
VOLUME /doge
VOLUME /keys
ENTRYPOINT ["/bin/sh","start_doge.sh"]
