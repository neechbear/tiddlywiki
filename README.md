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
$ sudo mkdir /etc/tiddlywiki/
$ sudo cp tiddlywiki.service /etc/systemd/system/
$ sudo cp tiddlywiki.service.conf /etc/tiddlywiki/
$ sudo systemctl daemon-reload
$ sudo systemctl enable tiddlywiki.service
$ sudo systemctl start tiddlywiki.service
$ sudo systemctl status tiddlywiki.service
$ sudo journalctl -u tiddlywiki.service
```

### SystemD with Custom Username

Uncomment the `TW_USERNAME` and/or `TW_PASSWORD` lines from the
`/etc/tiddlywiki/tiddlywiki.service.conf` file, and change as necessary.

```
$ sudo vi /etc/tiddlywiki/tiddlywiki.service.conf
$ sudo systemctl daemon-reload
$ sudo systemctl restart tiddlywiki.service
```
