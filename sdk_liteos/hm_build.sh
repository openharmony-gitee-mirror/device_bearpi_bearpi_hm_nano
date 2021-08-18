#!/bin/bash
set -e
product_out_dir="$1"
# prebuild #
cd ../../../../device/bearpi/bearpi_hm_nano/sdk_liteos
CROOT=$(pwd)

OUTPUT_SRC_DIR=$CROOT/output/bin
OUTPUT_DST_DIR=$1

OHOS_LIBS_DIR=$CROOT/ohos/libs

rm $OHOS_LIBS_DIR -rf

mkdir -p $OHOS_LIBS_DIR
find $OUTPUT_DST_DIR/libs/ -name '*.a' -exec cp "{}" $OHOS_LIBS_DIR  \;
find $CROOT/3rd_sdk/ -name '*.a' -exec cp "{}" $OHOS_LIBS_DIR  \;


# build #
./build.sh wifiiot_app

# after build #
if [ ! -d $OUTPUT_DST_DIR ]; then
   mkdir $OUTPUT_DST_DIR
fi
cp $OUTPUT_SRC_DIR/* $OUTPUT_DST_DIR/ -rf

