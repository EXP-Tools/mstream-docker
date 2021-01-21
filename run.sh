#!/bin/bash
# 运行 mStream 服务
#------------------------------------------------
# 命令执行示例：
# ./run.sh -u admin -p admin123 -i 1000 -g 1000
#------------------------------------------------

USER="admin"
PASS="admin123"
UID=`id | awk -F '[(=]' '{print $2}'`
GID=`id | awk -F '[(=]' '{print $4}'`

set -- `getopt u:p:i:g: "$@"`
while [ -n "$1" ]
do
  case "$1" in
    -u) USER="$2"
        shift ;;
    -p) PASS="$2"
        shift ;;
    -i) UID="$2"
        shift ;;
    -g) GID="$2"
        shift ;;
  esac
  shift
done

username=${USER} password=${PASS} uid=${UID} gid=${GID} docker-compose up -d
