#!/bin/bash

# Usage: 见 ./readme.md

# test
# WEB_HOOK_HOST="https://open.feishu.cn/open-apis/bot/v2/hook/fbd1ec5e-c36c-46e1-a80e-0c76f249be8e"

# test2
WEB_HOOK_HOST="https://open.feishu.cn/open-apis/bot/v2/hook/3d4d5ec7-e2f3-4c73-83ac-8edc23ade329"

# prod
# WEB_HOOK_HOST="https://open.feishu.cn/open-apis/bot/v2/hook/6322a12d-f818-4e21-ab77-14c43f03442c"

# function sendWebhook() {
#     file=$1
#     branch=$2
#     version=$3
#     changelog=$4
#     url=$5
#     install_url=$6

#     echo $file

#     content=$(cat $file)
#     content=${content/\{\{branch\}\}/$branch}
#     content=${content/\{\{version\}\}/$version}
#     content=${content/\{\{changelog\}\}/$changelog}

#     if [ -n "$url" ]
#     then
#         content=${content/\{\{url\}\}/$url}
#     fi

#     if [ -n "$install_url" ]
#     then
#         content=${content/\{\{mobile_url\}\}/$install_url}
#     fi

#     echo $content

#     curl -X POST -H "Content-Type: application/json" \
#     -d "$content" \
#     $WEB_HOOK_HOST
# }

BASEDIR=$(dirname "$0")

while [ ! $# -eq 0 ]; do
    echo "handle arg $1"
    case "$1" in
    -h | --help)
        display_help
        exit 1
        ;;
    --title=*)
        TITLE=$(echo "$1" | sed -e 's/^.*=//g')
        ;;
    --content=*)
        CONTENT=${1/"--content="/}
        ;;
    --branch=*)
        BRANCH=${1/"--branch="/}
        ;;
    --version=*)
        VERSION=${1/"--version="/}
        ;;
    --changelog=*)
        CHANGELOG=${1/"--changelog="/}
        ;;
    --ios-url=*)
        IOS_URL=${1/"--ios-url="/}
        ;;
    --android-url=*)
        ANDROID_URL=${1/"--android-url="/}
        ;;
    --url=*)
        URL=${1/"--url="/}
        ;;
    --file=*)
        FILE=${1/"--file="/}
        ;;
    esac
    shift
done

# echo 'basedir' $BASEDIR
# echo 'title' $TITLE
# echo 'content' $CONTENT
# echo 'changelog' $CHANGELOG
# echo 'ios_url' $IOS_URL
# echo 'android_url' $ANDROID_URL
# echo 'url' $URL
# echo 'file' "$BASEDIR/$FILE"

FILE_PATH="$BASEDIR/$FILE"

DATA=$(cat $FILE_PATH)
DATA=${DATA//\{\{title\}\}/"$TITLE"}
DATA=${DATA//\{\{content\}\}/"$CONTENT"}
DATA=${DATA//\{\{branch\}\}/"$BRANCH"}
DATA=${DATA//\{\{version\}\}/"$VERSION"}
DATA=${DATA//\{\{changelog\}\}/"$CHANGELOG"}
DATA=${DATA//\{\{ios_url\}\}/"$IOS_URL"}
DATA=${DATA//\{\{android_url\}\}/"$ANDROID_URL"}
DATA=${DATA//\{\{url\}\}/"$URL"}

DATA='{"msg_type": "interactive", "card": '$DATA'}'

echo 'data' "$DATA"

# curl -X POST -H "Content-Type: application/json" \
#     -d "$DATA" \
#     $WEB_HOOK_HOST

curl -X POST -H "Content-Type: application/json" \
    -d "$DATA" \
    $WEB_HOOK_HOST
