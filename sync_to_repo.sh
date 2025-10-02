#!/bin/bash
set -e

# 引入通用配置
source ./sync_config.sh

# 同步函数（本地到仓库）
sync_game() {
    local game="$1"
    local local_dir="$2"
    local repo_dir="$3"
    echo "同步: $game"
    mkdir -p "${repo_dir}/${game}"
    cp -r "${local_dir}/${game}/"* "${repo_dir}/${game}/"
}

echo "3秒后开始同步到仓库..."
sleep 3

# 执行同步
for game in "${DOCS_GAMES[@]}"; do
    sync_game "$game" "$DOCS_LOCAL" "$DOCS_REPO"
done
for game in "${SAVED_GAMES[@]}"; do
    sync_game "$game" "$SAVED_LOCAL" "$SAVED_REPO"
done

echo "同步完成！"
