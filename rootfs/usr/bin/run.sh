#!/bin/bash

syslog-ng -f /etc/syslog-ng/syslog-ng.conf

GOOFYS_CMD="/usr/local/bin/goofys";

if [ "$UID" -ne "0" ]; then
  GOOFYS_CMD="$GOOFYS_CMD --uid $UID";
fi

if [ "$GID" -ne "0" ]; then
  GOOFYS_CMD="$GOOFYS_CMD --gid $GID";
fi

if [ -n "$DIR_MODE" ]; then
  GOOFYS_CMD="$GOOFYS_CMD --dir-mode $DIR_MODE";
fi

if [ -n "$FILE_MODE" ]; then
  GOOFYS_CMD="$GOOFYS_CMD --file-mode $FILE_MODE";
fi

if [ -n "$ACL" ]; then
  GOOFYS_CMD="$GOOFYS_CMD --acl $ACL";
fi

if [ -n "$ENDPOINT" ]; then
  GOOFYS_CMD="$GOOFYS_CMD --endpoint $ENDPOINT";
fi

if [ -n "$STAT_CACHE_TTL" ]; then
  GOOFYS_CMD="$GOOFYS_CMD --stat-cache-ttl $STAT_CACHE_TTL";
fi

if [ -n "$TYPE_CACHE_TTL" ]; then
  GOOFYS_CMD="$GOOFYS_CMD --type-cache-ttl $TYPE_CACHE_TTL";
fi

if [ -n "$MOUNT_ACCESS" ]; then
  GOOFYS_CMD="$GOOFYS_CMD -o $MOUNT_ACCESS";
elif [[ "$UID" -ne "0" ]]; then
  GOOFYS_CMD="$GOOFYS_CMD -o allow_other";
else
  GOOFYS_CMD="$GOOFYS_CMD -o nonempty";
fi

GOOFYS_CMD="$GOOFYS_CMD -f $BUCKET $MOUNT_DIR";

echo "Goofys start command is: [$GOOFYS_CMD]..." > /dev/stdout

$GOOFYS_CMD
