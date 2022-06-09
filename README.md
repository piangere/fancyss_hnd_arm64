# 简介
这是[hq450/fancyss](https://github.com/hq450/fancyss)的fork，适用于koolcenter固件的nhd arm64 (armv8) 的路由器。

主要目的是提升[arm64路由器的性能](https://github.com/hq450/fancyss/issues/32812)。

## 与原版fancyss_nhd区别
原版fancyss_nhd的二进制是armv7版本，无法发挥arm64路由器的最佳性能（如无法使用ARMv8 Cryptography Extensions）。本fork同步原版fancyss_nhd功能，但是将核心二进制替换为arm64版。
* 包含了arm64版本的shadowsocks-rust。shadowsocks-rust资源占用远低于shadowsocks-libev。需要勾选"附加功能" -> "用shadowsocks-rust替代shadowsocks-libev"激活。
* arm64版本的shadowsock-libev（不支持TCP fast open）
* arm64版本的kcptun
* arm64版本的xray
* arm64版本的v2ray
* 删除更新shadowsocks-rust、v2ray、xray二进制功能。通过发包来更新。

## 支持的路由器
理论上，所有fancyss_hnd支持的nhd arm64 (armv8) 路由器都支持。包括：
* RT-AC86U
* GT-AC2900
* GT-AC5300
* RT-AX88U
* RAX80
* GT-AX11000
* RT-AX92U
* RT-AX68U
* RT-AX86U
* GT-AXE11000
* GT-AX6000
* ZenWiFi_Pro_XT12

# 安装
1. 下载 packages/fancyss_arm64_full.tar.gz，在 KoolCenter 软件中心选择“手动安装”。
2. 安装后将覆盖原有的fancyss_hnd，原有配置会保留。
3. 后续可在线升级。在线升级将使用本fork的仓库。

# 编译/打包
## 前置条件
需要Linux环境，并安装了以下工具。
* upx
* wget
* curl
* unzip
* make
* jq
## 打包 (更新二进制，打新包)
```console
user@host:~$ make
```