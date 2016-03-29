#!/bin/bash

export MASTER_IP="10.245.2.2"
export MINION_IP="10.245.2.3"

if [[ -z ${DEVOPS_TEMP-} ]]; then
    export DEVOPS_TEMP=$(mktemp -d -t devops.XXXXXX)
    trap 'rm -rf "${DEVOPS_TEMP}"' EXIT
fi

(
    echo "#! /bin/bash"
    echo "MASTER_IP='${MASTER_IP}'"
    sed -e '/^#/d' provision-minion.sh
) > "${DEVOPS_TEMP}/minion-start.sh"

vagrant up
