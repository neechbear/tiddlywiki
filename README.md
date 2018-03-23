# tiddlywiki

TiddlyWiki Docker image.

## Manual Execution

```
$ docker run -p 8080:8080 --name mywiki nicolaw/tiddlywiki
```

## Custom Username

```
$ docker run -p 8080:8080 \
    -e "TW_USERNAME=$USER" \
    -e "TW_PASSWORD=hunter2" \
    --name mywiki nicolaw/tiddlywiki
```

## SystemD Service

```
$ sudo cp tiddlywiki.service /etc/systemd/system/
$ sudo systemctl daemon-reload
$ sudo systemctl enable tiddlywiki.service
$ sudo systemctl start tiddlywiki.service
$ sudo systemctl status tiddlywiki.service
$ sudo journalctl -u tiddlywiki.service
```

