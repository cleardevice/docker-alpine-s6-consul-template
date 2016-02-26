# docker-alpine-s6-consul-template

[![](https://badge.imagelayers.io/cleardevice/docker-alpine-s6-consul-template:latest.svg)](https://imagelayers.io/?images=cleardevice/docker-alpine-s6-consul-template:latest 'Get your own badge on imagelayers.io')

## [Alpine Linux](http://alpinelinux.org/) base image plus s6 init system

Built FROM [cleardevice/docker-alpine-init](https://github.com/cleardevice/docker-alpine-init)

### ...start your Dockerfile

```shell
FROM cleardevice/docker-alpine-s6-consul-template
```

+ Provides s6 init system via [s6-overlay](https://github.com/just-containers/s6-overlay), cURL and Bash
