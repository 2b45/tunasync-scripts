#!/bin/bash
# requires: docker 

set -e
set -o pipefail

BASE_PATH="${TUNASYNC_WORKING_DIR}"
BASE_URL=${TUNASYNC_UPSTREAM_URL:-"http://update.cs2c.com.cn:8080"}

_here=`dirname $(realpath $0)`


export REPO_SIZE_FILE=/tmp/reposize.$RANDOM

docker run --rm \
    -v $BASE_PATH:/mirrors/cs2c \
    -v /home/scripts/:/home/scripts/ \
    tunathu/tunasync-scripts \
    /bin/bash /home/scrips/cs2c.sh 

echo "YUM finished"
"${_here}/helpers/size-sum.sh" $REPO_SIZE_FILE --rm

