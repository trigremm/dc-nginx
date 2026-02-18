# dc-nginx

Nginx demo with custom HTML, reverse proxy templates and port forwarding notes.

## Quick start

```bash
make r          # build + start
make l          # follow logs
```

## Commands

### Lifecycle

```
make d          # deploy (git pull + recreate)
make r          # recreate (build + stop + up)
make up         # start
make stop       # stop
make down       # stop and remove
make ps         # status
make l          # follow logs
```

### Nginx

```
make nginx-shell    # sh shell in nginx container
make nginx-reload   # reload nginx config
make test           # run smoke test (HTTP 200)
```

## Configs

- `conf.d/default.conf` — localhost SPA config (try_files)
- `conf.d/www.demo.com` — production reverse proxy template (upstream, gzip, security headers)

## Port forwarding (TCP/UDP via nginx stream module)

```
yum install nginx-mod-stream
```

See: https://nginx.org/en/docs/stream/ngx_stream_core_module.html
