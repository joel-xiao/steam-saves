#!/bin/bash
set -e

# 引入通用配置
source ./sync_config.sh

# 同步函数（仓库到本地）
sync_game() {
    local game="$1"
    local repo_dir="$2"
    local local_dir="$3"
    echo "同步: $game"
    mkdir -p "${local_dir}/${game}"
    cp -r "${repo_dir}/${game}/"* "${local_dir}/${game}/"
}

echo "3秒后开始从仓库同步到本地..."
sleep 3

# 执行同步
for game in "${DOCS_GAMES[@]}"; do
    sync_game "$game" "$DOCS_REPO" "$DOCS_LOCAL"
done
for game in "${SAVED_GAMES[@]}"; do
    sync_game "$game" "$SAVED_REPO" "$SAVED_LOCAL"
done

echo "同步完成！"
