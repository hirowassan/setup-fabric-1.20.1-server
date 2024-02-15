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
    curl -OJ https://meta.fabricmc.net/v2/versions/loader/1.20.1/0.15.6/1.0.0/server/jar
    mv ./*.jar ./server.jar

    #eulaを記述
    echo "eula=true" >> eula.txt

    #start.shを作成
    echo java -Xms20G -Xmx25G -jar server.jar nogui >> start.sh

    #modを導入(spigotでいうpluginを導入)
    mkdir mods && cd ./mods
        #Carpetというmod(便利機能の詰め合わせ)のダウンロード
    curl -OJ https://cdn.modrinth.com/data/TQTTVgYE/versions/K0Wj117C/fabric-carpet-1.20-1.4.112%2Bv230608.jar

    #FabricAPIという前提modをダウンロード
    curl -OJ https://cdn.modrinth.com/data/P7dR8mSH/versions/YG53rBmj/fabric-api-0.92.0%2B1.20.1.jar

    #これも前提mod
    curl -OJ https://cdn.modrinth.com/data/9s6osm5g/versions/J3FLptsi/cloth-config-11.1.118-fabric.jar

    #SyncMaticaという、LiteMaticaという名前の設計図を表示するmodの設計図を共有できる機能を使えるようにするmod
    curl -OJ https://cdn.modrinth.com/data/bfneejKo/versions/JxB3gBzc/syncmatica-1.20.1-0.3.11.jar

    #MemoryLeakFixというメモリーのバグなどをなおすmod
    curl -OJ https://cdn.modrinth.com/data/NRjRiSSD/versions/5xvCCRjJ/memoryleakfix-fabric-1.17%2B-1.1.5.jar

    #バックアップmod
    curl -JO https://mediafilez.forgecdn.net/files/4749/914/textile_backup-3.1.2-1.20.jar
　
    echo "bash ./start.shでサーバーを起動できます。ワールドデータを移したいときは ~/minecraft-server/fabric-1.20.1 に移>動させてください。"

    echo "server.propertiesのrate-limitを0にすると、パケット量によるキックが起こらなくなるのでcarpetを使う際は設定しておきましょう。"
else
    echo "Javaがインストールされていません。インストールしてください。"
fi
                                     
