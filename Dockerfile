FROM node:9.5.0-alpine
RUN npm install -g tiddlywiki
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki
EXPOSE 8080
CMD ["/usr/local/bin/init-and-run-wiki"]
