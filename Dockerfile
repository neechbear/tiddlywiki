# MIT License
# Copyright (c) 2017 Nicola Worthington <nicolaw@tfb.net>

FROM node:9.5.0-alpine
LABEL author="Nicola Worthington <nicolaw@tfb.net>"

VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki
RUN npm install -g tiddlywiki

EXPOSE 8080

ENV TW_WIKINAME mywiki
ENV TW_PORT 8080
ENV TW_ROOTTIDDLER $:/core/save/all
ENV TW_RENDERTYPE text/plain
ENV TW_SERVETYPE text/html
ENV TW_USERNAME anonymous
ENV TW_PASSWORD ""
ENV TW_HOST 0.0.0.0
ENV TW_PATHPREFIX ""

ADD init-and-run /usr/local/bin/init-and-run
CMD ["/bin/sh","/usr/local/bin/init-and-run"]
