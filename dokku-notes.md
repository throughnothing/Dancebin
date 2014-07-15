## Dokku Notes

## How to attach to a running container:

https://github.com/dotcloud/docker/issues/1228

    $ lxc-attach -n FULLCONTAINERID /bin/bash

## Cleaning out the db (sqlite):

    sqlite> delete from posts where expiration < 'now';
