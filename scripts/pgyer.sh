#!/bin/bash

# fail if any command fails
set -e

PGY_API_HOST='https://www.pgyer.com/apiv2/app/upload'
PGY_API_KEY='b34f32eda4170c7c11d37568a4abc582'

BASEDIR=$(dirname "$0")

BUILD_FILE=''
PLATFORM="ios"
NOTIFY_CONTENT=""

function displayHelp() {
    echo ''
    echo '上传安装包到蒲公英的脚本，成功后通过webhook广播到飞书中'
    echo ''
    echo '使用方法：bash pgyer.sh --options'
    echo ''
    echo '  -h, --help\t\t帮助文档'
    echo '  --platform\t\t平台，选项有ios、android'
    echo '  --file\t\t待上传的文件路径'
    echo '  --content\t通知的内容体'
}

while [ ! $# -eq 0 ]; do
    echo "hanle arg $1"
    case "$1" in
    -h | --help)
        displayHelp
        exit 1
        ;;
    --platform=*)
        PLATFORM=$(echo "$1" | sed -e 's/^-[-A-Za-z0-9]*=//g')
        ;;
    --file=*)
        BUILD_FILE=$(echo "$1" | sed -e 's/^-[-A-Za-z0-9]*=//g')
        ;;
    --content=*)
        NOTIFY_CONTENT=${1/"--content="/}
        ;;
    --title=*)
        TITLE=${1/"--title="/}
        ;;
    esac
    shift
done

# 需使用 jq 服务，检测是否安装，若未安装则先安装
if ! command -v jq &> /dev/null
then
    brew install jq
fi



# 上传
echo -e "上传蒲公英中.."

RESP=$(curl -F "file=@$BUILD_FILE" \
    -F "_api_key=$PGY_API_KEY" \
    "$PGY_API_HOST")

echo "$RESP"

BUILD_QR_URL=$(echo $RESP | jq -r '.data.buildQRCodeURL')
BUILD_KEY=$(echo $RESP | jq -r '.data.buildKey')
SHORTURL="https://pgyer.com/$(echo $RESP | jq -r '.data.buildShortcutUrl')"
echo "short url: $SHORTURL"

NOTIFY_CONTENT="$NOTIFY_CONTENT\n\n[🔗 固定安装链接]($SHORTURL)\n"

IOS_URL="$BUILD_QR_URL"
ANDROID_URL="$BUILD_QR_URL"

if [ "$PLATFORM" = "ios" ]; then
    IOS_URL="itms-services://?action=download-manifest&url=https://www.pgyer.com/app/plist/$BUILD_KEY"
elif [ "$PLATFORM" = "android" ]; then
    ANDROID_URL="https://www.pgyer.com/apiv2/app/install?_api_key=${PGY_API_KEY}&buildKey=$BUILD_KEY"
fi

# 通知
bash "$BASEDIR/lark_bot/webhook.sh" \
    --file="pgyer_webhook.json" \
    --title="$TITLE" \
    --content="$NOTIFY_CONTENT" \
    --url="$BUILD_QR_URL" \
    --ios-url="$IOS_URL" \
    --android-url="$ANDROID_URL" \

# 通知
# sendWebhook "$BASH_DIR/webhook/lark_bot/apk_to_pgyer.json" $GIT_BRANCH $APP_VERSION "$CHANGELOG" $BUILD_QR_URL $BUILD_INSTALL_URL
