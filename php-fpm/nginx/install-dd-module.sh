#!/bin/sh -x

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | jq --raw-output .tag_name
}
BASE_IMAGE=$1
BASE_IMAGE_WITHOUT_COLONS=$(echo "$BASE_IMAGE" | tr ':' '_')
RELEASE_TAG=$(get_latest_release DataDog/nginx-datadog)
#tarball="$BASE_IMAGE_WITHOUT_COLONS-amd64-ngx_http_datadog_module.so.tgz"
tarball="ngx_http_datadog_module-amd64-1.27.0.so.tgz"
wget "https://github.com/DataDog/nginx-datadog/releases/download/$RELEASE_TAG/$tarball"
tar -xzf "$tarball" -C /usr/lib/nginx/modules
rm "$tarball"
ls -l /usr/lib/nginx/modules/ngx_http_datadog_module.so
