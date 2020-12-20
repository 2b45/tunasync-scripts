#!/bin/bash
# requires: wget, yum-utils, timeout, md5sum
# 抓取站点
# http://archive.kylinos.cn/kylin/KYLIN-ALL/

set -e
set -o pipefail

_here=`dirname $(realpath $0)`
apt_sync="${_here}/apt-sync.py"

#chmod +x $apt_sync

BASE_PATH="${TUNASYNC_WORKING_DIR}"
BASE_URL=${TUNASYNC_UPSTREAM_URL:-"http://archive.kylinos.cn/kylin/KYLIN-ALL"}


export REPO_SIZE_FILE=/data/tmp/reposize.$RANDOM

#archs=amd64,arm64,armhf,i386,mips64el,sw64
archs=amd64,arm64,i386
os_versions=4.0.2-desktop,4.0.2sp1-desktop,4.0.2sp2-desktop,4.0.2-server,4.0.2sp1-server,4.0.2sp2-server,4.0.2sp2-server-ft2000,4.0.2sp3-desktop,4.0.2sp3-server,4.0.2sp4-desktop,10.0,10.1
"$apt_sync" --delete "$BASE_URL" $os_versions main,restricted,universe,multiverse  $archs "$BASE_PATH"

echo "APT finished"

"${_here}/helpers/size-sum.sh" $REPO_SIZE_FILE --rm


