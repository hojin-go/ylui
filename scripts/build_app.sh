#!/usr/bin/env bash

# fail if any command fails
set -e
# debug log
# set -x

# the project workspace directory
PROJECT_DIR="example"
# 飞书上线群里的 bot
WEB_HOOK="https://open.feishu.cn/open-apis/bot/v2/hook/6322a12d-f818-4e21-ab77-14c43f03442c"
# 飞书机器人测试
# WEB_HOOK="https://open.feishu.cn/open-apis/bot/v2/hook/fbd1ec5e-c36c-46e1-a80e-0c76f249be8e"

# 下载代码

# 准备
function beforeBuild() {
  sBranch="$(git branch --show-current)"
  echo $sBranch
  cd $PROJECT_DIR
  # Find and increment the version number.
  perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' pubspec.yaml
  getVersionAndLog
}

# 获取 version 号码和最近几次提交记录
function getVersionAndLog() {
  APP_VERSION="$(cat pubspec.yaml | sed -n 's/^version: \(.*+.*\)$/\1/p')"
  echo $APP_VERSION

  # sendApkWebHook
  # sendIpaToPgyWebHook
  # read
  # pull new code
  # list newest 5 commits
  echo ''
  git --no-pager lg -3
  echo ''
  echo ''
  echo '👆上面是最近3条提交记录'
  echo ''
}

#### build
function buildApk() {
  echo "build apk ing .."
  flutter clean
  flutter build apk --release
}

function uploadToPgyer() {
  echo -e "$INFO 上传蒲公英中.."
  filePath="build/app/outputs/flutter-apk/app-release.apk"

  curl -F "file=@$filePath" \
    -F "uKey=93ebcbdb640255ed2a360e391aecdb95" \
    -F "_api_key=6aa296e061465ffc6a49c548f071641a" \
    https://www.pgyer.com/apiv1/app/upload
  echo
}

# 打包ipa
function buildIpaToPgyer() {
  # flutter clean
  # flutter build ios --config-only
  # xcarchive
  # xcodebuild archive -workspace ios/Runner.xcworkspace -scheme Runner -configuration release -archivePath build/ios/iphoneos/Runner.xcarchive -sdk iphoneos
  # ipa
  pwd
  xcodebuild -exportArchive -archivePath build/ios/iphoneos/Runner.xcarchive -exportPath build/ios/iphoneos/ -exportOptionsPlist ../scripts/ExportOptions.plist

  uploadIpaToPgyer
}

# 上传蒲公英
function uploadIpaToPgyer() {
  echo -e "$INFO 上传蒲公英中.."
  filePath="build/ios/iphoneos/ylui.ipa"

  curl -F "file=@$filePath" \
    -F "uKey=93ebcbdb640255ed2a360e391aecdb95" \
    -F "_api_key=6aa296e061465ffc6a49c548f071641a" \
    https://www.pgyer.com/apiv1/app/upload
  echo
}

#### WebHook
function sendApkWebHook() {
  ## 安卓发布 WebHook 机器人测试
  curl -X "POST" $WEB_HOOK \
    -H 'Content-Type: text/plain; charset=utf-8' \
    -d '{"msg_type":"interactive","card":{"config":{"wide_screen_mode":true,"enable_forward":true},"elements":[{"tag":"div","text":{"content":"**'"$sBranch"'** 分支，**'"$APP_VERSION"'** 版本的 **安卓** ylui组件测试包已经发布到蒲公英，可前往安装","tag":"lark_md"}},{"actions":[{"tag":"button","text":{"content":"前往安装","tag":"lark_md"},"url":"https://www.pgyer.com/ylui","type":"primary","value":{}}],"tag":"action"}],"header":{"title":{"content":"安卓组件测试版本发布","tag":"plain_text"}}}}'
}

function sendIpaToPgyWebHook() {
  ## iOS 发布 WebHook 机器人测试
  curl -X "POST" $WEB_HOOK \
    -H 'Content-Type: text/plain; charset=utf-8' \
    -d '{"msg_type":"interactive","card":{"config":{"wide_screen_mode":true,"enable_forward":true},"elements":[{"tag":"div","text":{"content":"**'"$sBranch"'** 分支，**'"$APP_VERSION"'** 版本的 **iOS** 测试包已经发布到蒲公英，可前往安装","tag":"lark_md"}},{"actions":[{"tag":"button","text":{"content":"前往安装","tag":"lark_md"},"url":"https://www.pgyer.com/eWlE","type":"primary","value":{}},{"tag":"button","text":{"content":"获取 UDID","tag":"lark_md"},"url":"https://lanehubcn.feishu.cn/docs/doccnpN7oCXq6N5P3BqS9QegIch#IPa97j","type":"default","value":{}}],"tag":"action"}],"header":{"title":{"content":"iOS 测试版本发布","tag":"plain_text"}}}}'

}

function sendIpaToAppleWebHook() {
  ## iOS 发布 WebHook 机器人测试
  curl -X "POST" $WEB_HOOK \
    -H 'Content-Type: text/plain; charset=utf-8' \
    -d '{"msg_type":"interactive","card":{"config":{"wide_screen_mode":true,"enable_forward":true},"elements":[{"tag":"div","text":{"content":"**'"$sBranch"'** 分支，**'"$APP_VERSION"'** 版本的 **iOS** 安装包已经提交到苹果，稍后可前往提交审核","tag":"lark_md"}},{"actions":[{"tag":"button","text":{"content":"前往 iTunes Connect","tag":"lark_md"},"url":"https://appstoreconnect.apple.com/apps","type":"primary","value":{}},{"tag":"button","text":{"content":"iOS 提交审核指南","tag":"lark_md"},"url":"https://lanehubcn.feishu.cn/docs/doccnFGNMfDkNrOgGeZA2r1gmyd#","type":"default","value":{}}],"tag":"action"}],"header":{"title":{"content":"iOS 准备提交审核","tag":"plain_text"}}}}'
}

function apkToOfficialSuccess() {
  ## iOS 发布 WebHook 机器人测试
  curl -X "POST" $WEB_HOOK \
    -H 'Content-Type: text/plain; charset=utf-8' \
    -d '{"msg_type":"interactive","card":{"config":{"wide_screen_mode":true,"enable_forward":true},"elements":[{"tag":"div","text":{"content":"**'"$sBranch"'** 分支，**'"$APP_VERSION"'** 版本的 **安卓** 安装包已经发布到官网","tag":"lark_md"}},{"actions":[{"tag":"button","text":{"content":"前往安装","tag":"lark_md"},"url":"https://www.yuanling.com/download","type":"primary","value":{}}],"tag":"action"}],"header":{"title":{"content":"安卓官网发布","tag":"plain_text"}}}}'
}

function apkBuildSuccessWebHook() {
  curl -X "POST" $WEB_HOOK \
    -H 'Content-Type: text/plain; charset=utf-8' \
    -d '{"msg_type":"interactive","card":{"config":{"wide_screen_mode":true,"enable_forward":true},"elements":[{"tag":"div","text":{"content":"**'"$sBranch"'** 分支，**'"$APP_VERSION"'** 版本的 **安卓** 测试包已经打包完成，复制命令下载：\n scp -P 8206 -r mikeooye@139.196.162.214:/Users/mikeooye/code/tmp/apk ~/Downloads","tag":"lark_md"}}],"header":{"title":{"content":"安卓提审包发布","tag":"plain_text"}}}}'
}

echo '  1. Android -> Pgyer'
echo '  2. iOS -> Pgyer'
echo '  3. Android + iOS -> Pgyer'
# echo '  4. 修改版本号'
# echo '  5. Android channel release'
# echo '  6. iOS -> AppStore'
# echo '  7. 添加 Apple 设备 ID'

# -n1 仅输入一个字符
# -e 支持交互式输入
read -e -n1 -p '请选择: ' sPlatform

if [ $sPlatform == "1" ]; then
  # 打包安卓版本到蒲公英
  beforeBuild
  buildApk
  uploadToPgyer
  sendApkWebHook

elif [ $sPlatform == "2" ]; then
  # 打包 iOS 版本到蒲公英

  beforeBuild
  buildIpaToPgyer
  # sendIpaToPgyWebHook
elif [ $sPlatform == '3' ]; then
  # 打包安卓和iOS版本到蒲公英

  beforeBuild
  buildApk
  uploadToPgyer
  sendApkWebHook
  buildIpaToPgyer
  sendIpaToPgyWebHook
else
  echo 'input wrong'
fi
