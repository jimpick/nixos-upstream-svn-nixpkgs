buildInputs="$mysql_jdbc"
source $stdenv/setup

ensureDir $out/server/default/lib
ln -s $mysql_jdbc/share/java/mysql-connector-java.jar $out/server/default/lib/mysql-connector-java.jar
