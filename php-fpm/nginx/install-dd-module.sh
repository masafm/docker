#!/bin/sh -x

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | jq --raw-output .tag_name
}
BASE_IMAGE=$1
BASE_IMAGE_VERSION=$(echo "$BASE_IMAGE" | sed -e 's/.*://' -e 's/-.*//')
RELEASE_TAG=$(get_latest_release DataDog/nginx-datadog)
ARCH=$(uname -m)
if [[ $ARCH == "aarch64" ]];then
    ARCH=arm64
elif [[ $ARCH == "x86_64" ]];then
    ARCH=amd64
fi
tarball="ngx_http_datadog_module-${ARCH}-${BASE_IMAGE_VERSION}.so.tgz"
wget "https://github.com/DataDog/nginx-datadog/releases/download/$RELEASE_TAG/$tarball"
tar -xzf "$tarball" -C /usr/lib/nginx/modules
rm "$tarball"
ls -l /usr/lib/nginx/modules/ngx_http_datadog_module.so
