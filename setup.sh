cd ~
mkdir minecraft-server && cd minecraft-server
mkdir fabric-1.20.1 &&cd fabric-1.20.1
wget -o server.jar https://meta.fabricmc.net/v2/versions/loader/1.20.4/0.15.6/1.0.0/server/jar
echo "eula=true" >> eula.txt
echo java -Xms20G -Xmx25G -jar server.jar nogui
