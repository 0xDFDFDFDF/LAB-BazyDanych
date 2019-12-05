#!/bin/sh -x

. /build/config-hbase.sh

apt-get update && apt-get install $minimal_apt_get_args $HBASE_BUILD_PACKAGES $HBASE_RUN_PACKAGES

cd /opt

curl -SL $HBASE_DIST/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz | tar -x -z && mv hbase-${HBASE_VERSION} hbase
