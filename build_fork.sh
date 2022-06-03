#!/usr/bin/env bash

set -e

source ./build.sh

patch(){
  echo "patching $1 $2 build"
  for file in ./shadowsocks/scripts/ss_update.sh ./shadowsocks/scripts/ss_v2ray.sh ./shadowsocks/scripts/ss_xray.sh ./shadowsocks/scripts/ss_rust_update.sh ./shadowsocks/webs/Module_shadowsocks.asp
  do
    if [ -f "$file" ]; then
      echo "patching $file"
      sed -i 's/raw.githubusercontent.com\/hq450\/fancyss\/3.0/raw.githubusercontent.com\/piangere\/fancyss_hnd_arm64\/3.0_fork/g' "$file"
    fi
  done
}

pack(){
	gen_folder $1 $2
	patch $1 $2
	build_pkg $1 $2
	# do_backup  $1 $2
	rm -rf ${CURR_PATH}/shadowsocks/
}

make