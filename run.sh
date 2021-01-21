#!/bin/bash
# 运行 mStream 服务
#------------------------------------------------
# 命令执行示例：
# ./run.sh -u admin -p admin123 -i 1000 -g 1000
#------------------------------------------------

USER="admin"
PASS="admin123"
U_ID=`id | awk -F '[(=]' '{print $2}'`
G_ID=`id | awk -F '[(=]' '{print $4}'`

set -- `getopt u:p:i:g: "$@"`
while [ -n "$1" ]
do
  case "$1" in
    -u) USER="$2"
        shift ;;
    -p) PASS="$2"
        shift ;;
    -i) U_ID="$2"
        shift ;;
    -g) G_ID="$2"
        shift ;;
  esac
  shift
done

username=${USER} password=${PASS} uid=${U_ID} gid=${G_ID} docker-compose up -d
