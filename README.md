# `postfix-pgsql`
This Dockerfile builds `postfix` with `postgresql` support from source (god gracious me the docs are... not ez). It has been made because apparently no one published such an image and I need this for [SimpleLogin](https://github.com/simple-login/app).

The base for `postgresql` drivers are version 11 but it might work with newer ones since I used the `postgresql-server-dev-all` package. I have not tested this yet.

**DISCLAIMER:** This is a very simple Dockerfile. Best practices have not been applied yet and will only be reviewed if needed by the author (me). Furthermore I shall not be held liable for any damage caused by this software. For more information see the [LICENSE](./LICENSE.md).

## Usage
You should be fine with:
```sh
docker run \
    -v /path/to/your/conf:/etc/postfix \
    -v /log/file/folder:/var/log/postfix \
    -v /spool/folder:/var/spool/postfix
    -p 25:25 \
    0x5ecf4ult/postfix-pgsql
```
`docker-compose` / Docker Swarm example:
```docker
version: '3.8'

services:
  postfix:
    image: 0x5ecf4ult/postfix-pgsql
    volumes:
      - /path/to/your/conf:/etc/postfix
      - /log/file/folder:/var/log/postfix
      - /spool/folder:/var/spool/postfix
    ports:
      - '25:25'
```