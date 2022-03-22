#!/usr/bin/bash

# fail if any command fails
set -e
# debug log
# set -x

# the project workspace directory
PROJECT_DIR="example"
PROJECT_NAME="ylui组件库"

BASEDIR=$(dirname "$0")

echo $BASEDIR

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
  APP_VERSION=$(cat pubspec.yaml | grep version: | sed 's/version: //g')

  echo "[$APP_VERSION]"

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

  bash "../scripts/pgyer.sh" --platform="android" --title="YLUI组件测试版本发布" --content="Android，版本号：${APP_VERSION}。" --file="$filePath"
}

# 打包ipa
function buildIpaToPgyer() {
  flutter clean
  flutter build ios --config-only
  # xcarchive
  xcodebuild archive -workspace ios/Runner.xcworkspace -scheme Runner -configuration release -archivePath build/ios/iphoneos/Runner.xcarchive -sdk iphoneos
  # ipa
  pwd
  xcodebuild -exportArchive -archivePath build/ios/iphoneos/Runner.xcarchive -exportPath build/ios/iphoneos/ -exportOptionsPlist ../scripts/ExportOptions.plist

  uploadIpaToPgyer
}

# 上传蒲公英
function uploadIpaToPgyer() {
  echo -e "$INFO 上传蒲公英中.."
  filePath="build/ios/iphoneos/ylui.ipa"

  bash "../scripts/pgyer.sh" --platform="ios" --title="YLUI组件测试版本发布" --content="iOS, 版本号：${APP_VERSION}。" --file="$filePath"
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

elif [ $sPlatform == "2" ]; then
  # 打包 iOS 版本到蒲公英

  beforeBuild
  buildIpaToPgyer
elif [ $sPlatform == '3' ]; then
  # 打包安卓和iOS版本到蒲公英

  beforeBuild
  buildApk
  uploadToPgyer
  buildIpaToPgyer
else
  echo 'input wrong'
fi
