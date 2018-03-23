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

### SystemD with Custom Username

As above, but you will need to modify the `tiddlywiki.service` file to add an
`--env-file` argument to the `ExecStart=/usr/sbin/docker` command:

```
ExecStart=/usr/bin/docker run -p 8080:8080 --env-file /etc/tiddlywiki/%n.conf -v
%n:/var/lib/tiddlywiki --name %n nicolaw/tiddlywiki
```

You can then place your username and password into a configration file of the
same name as the systemd service:

```
$ mkdir -p /etc/tiddlywiki/
$ cat << 'EOF' > /etc/tiddlywiki/tiddlywiki.service.conf
TW_USERNAME=janedoe
TW_PASSWORD=bashrulesok
EOF
```

