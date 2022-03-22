# 飞书 Webhook

## 飞书模板配置链接
https://open.feishu.cn/tool/cardbuilder?from=cotentmodule

## Usage
```bash
Usage:
bash ./webhook/lark_bot/webhook.sh \
    --title="我是标题啊啊啊啊" \
    --content="我是内容啊啊啊啊" \
    --ios-url="https://ios.install" \ 
    --android-url="https://android.install" \
    --url="https://install.xx" \
    --branch="develop" \
    --version="4.0.0+12345" \
    --changelog="log-start: c57ffa111\n[<0001f973>添加功能]\n•feat(settings): 个性化推荐设置文案调整\n•feat(medal): 潜力勋章说明页面\n•feat(user-talent): 圆领等级描述页面，推荐圆领底部增加小字提示\n•feat(user-talent): 人才等级页面调整\n•feat(talent-homepage): 人才主页信息已完善时，不展示已完善状态\n•feat(推广分): 修改自荐页面刷新\n•feat(推广分): 推广分连调\n•feat(推广分): 修改自荐权益页面文案\n\n[💪修复错误]\n•fix(user-talent): 人才我的页面，根据等级样式调整\n•fix(operation): 推广分-圆领等级介绍页面，修复遗失的小字文案\n•fix: 优化推广分UI显示\n•fix: 移除了一些未引用的第三方\n\n" \
    --file="apk_market_build_success.json"

```