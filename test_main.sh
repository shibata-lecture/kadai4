#!/usr/bin/bash

# いろいろな工夫を紹介するので力量に併せてテストを行おう

# ------------------------------
# ファイル名を変数にして入力省略
ans="/tmp/$$-ans"
result="/tmp/$$-result"
err_log="/tmp/$$-errors"


# ------------------------------
# 中断する類のエラーが起きた時の処理
function err_catch {
        echo "エラー時の処理"
}
trap catch err_catch

# 成功・失敗に関わらず行いたい処理
function final_func {
	rm ${ans} ${result} ${err_log}
}
trap finally final_func


# ------------------------------
# エラー動作時のチェック
## 正しいエラーメッセージか確認するため
## 標準エラー出力の内容を確認する
# エラー時に出力してほしい正解データ
echo "Input 2 argments" > ${ans}
# エラー時のデータ（入力数が足りない）
./main.sh 2> ${result} # 正しいエラーメッセージか確認するので2
diff ${ans} ${result} || echo "test 1-1: no input" >> ${err_log}


# ------------------------------
# 正常動作時のチェック
# 最大公約数が計算できているか
# 正常動作の正解データ
echo "2" > /tmp/$$-ans
# 正常動作の出力
./main.sh 2 4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト2-1" >> /tmp/$$-error.log


# ------------------------------
# エラーメッセージを出力する
if [ -f /tmp/$$-error.log ];then
        cat /tmp/$$-error.log 1>&2
        rm -f /tmp/$$-*
        exit 1
fi


# ここで挙げたものは一例なので、
# こういう時にエラーが起きそう
# というものを確認できるテストしよう
# 例：負の数、少数、極端に大きい数字、文字
