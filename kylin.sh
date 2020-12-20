#!/bin/bash
# requires: wget, yum-utils, timeout, md5sum
# 抓取站点-中标麒麟
# http://archive.kylinos.cn/kylin/KYLIN-ALL/

set -e
set -o pipefail

_here=`dirname $(realpath $0)`
apt_sync="${_here}/yum-sync.py"

#chmod +x $apt_sync

BASE_PATH="${TUNASYNC_WORKING_DIR}"
BASE_URL=${TUNASYNC_UPSTREAM_URL:-"http://archive.kylinos.cn/kylin/KYLIN-ALL"}

export REPO_SIZE_FILE=/data/tmp/reposize.$RANDOM

"$apt_sync" --delete "$BASE_URL" main,restricted,universe,multiverse amd64,arm64,armhf,i386,mips64el,sw64 "$BASE_PATH"    -

echo "APT finished"

"${_here}/helpers/size-sum.sh" $REPO_SIZE_FILE --rm


