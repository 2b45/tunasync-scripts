#!/bin/bash
# requires: wget  

set -e
set -o pipefail
_here=`dirname $(realpath $0)`

BASE_PATH="${TUNASYNC_WORKING_DIR}"
BASE_URL=${TUNASYNC_UPSTREAM_URL:-"https://down.52pojie.cn/"}

export REPO_SIZE_FILE=/tmp/reposize.$RANDOM

# start download by single process 
wget -N -m $BASE_URL -P $BASE_PATH

for x in $(find $BASE_PATH -name *index* -type f); do rm -rf $x ; done 
for x in $(find $BASE_PATH -name *js -type f); do rm -rf $x ; done 

echo "Wget finished"

"${_here}/helpers/size-sum.sh" $REPO_SIZE_FILE --rm

