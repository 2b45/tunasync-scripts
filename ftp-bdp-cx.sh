#!/bin/bash 

set -e
set -o pipefail

_here=`dirname $(realpath $0)`

BASE_PATH="${TUNASYNC_WORKING_DIR}"
BASE_URL=${TUNASYNC_UPSTREAM_URL:-"ftp://ftp.bdp-app.topsec.con.cn"}
export REPO_SIZE_FILE=/tmp/reposize.$RANDOM

lftp -e 'mirror -P 5 --verbose E:/DATAS/电子书 $BASE_PATH ' ftp://10.7.217.164

echo "FTP finished"

"${_here}/helpers/size-sum.sh" $REPO_SIZE_FILE --rm
