#!/bin/bash

export MASTER_IP="10.245.2.2"
export MINION_IP="10.245.2.3"

if [[ -z ${DEVOPS_TEMP-} ]]; then
    export DEVOPS_TEMP=$(mktemp -d -t devops.XXXXXX)
    trap 'rm -rf "${DEVOPS_TEMP}"' EXIT
fi

# minion主机需要知晓master等数据，通过初始化脚本来传递。
# 在vagrant场景，通过provision机制会复制脚本到VM里运行.
(
    echo "#! /bin/bash"
    echo "MASTER_IP='${MASTER_IP}'"
    sed -e '/^#/d' provision-minion.sh
) > "${DEVOPS_TEMP}/minion-start.sh"

vagrant up
