#!/bin/bash

# Javaのインストールをチェックする関数
check_java() {
    java -version >/dev/null 2>&1
    return $?
}

# Javaがインストールされているかどうかをチェック
if check_java; then
    #フォルダを作成
    cd ~
    mkdir minecraft-server && cd minecraft-server
    mkdir fabric-1.20.1 &&cd fabric-1.20.1

    #サーバーをダウンロード
    wget -o server.jar https://meta.fabricmc.net/v2/versions/loader/1.20.4/0.15.6/1.0.0/server/jar

    #eulaを記述
    echo "eula=true" >> eula.txt

    #start.shを作成
    echo java -Xms20G -Xmx25G -jar server.jar nogui >> start.sh
else
    echo "Javaがインストールされていません。インストールしてください。"
fi
