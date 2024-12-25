#!/bin/bash

# 檢查是否安裝 cliclick
if ! command -v cliclick &>/dev/null; then
  echo "未檢測到 cliclick，正在嘗試安裝..."

  # 檢查是否安裝 Homebrew
  if ! command -v brew &>/dev/null; then
    echo "未檢測到 Homebrew，請先安裝 Homebrew 並重試。"
    echo "安裝指令：/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
  fi

  # 使用 Homebrew 安裝 cliclick
  brew install cliclick

  if ! command -v cliclick &>/dev/null; then
    echo "cliclick 安裝失敗，請檢查 Homebrew 是否正常運作。"
    exit 1
  fi

  echo "cliclick 安裝完成！"
fi

# 設置總運行時間為半小時（1800 秒）
total_duration=1830

# 設置每次迴圈運行時間，包含所有操作和等待時間
loop_duration=$((180 + 3)) # 一個迴圈大約 183 秒

# 計算需要運行的迴圈次數
iterations=$((total_duration / loop_duration))

sleep 5
for ((i=0; i<iterations; i++))
do
  echo "開始執行第 $i 次操作..."

  # 中間點擊 (760, 540)
  sleep 0.2
  cliclick c:760,540
  sleep 0.2
  cliclick c:760,540

  # 等待 3 分鐘後重新執行
  sleep 180 # 180 秒 = 3 分鐘

  echo "完成第 $i 次操作，等待下一次..."
done

echo "執行完成！"

