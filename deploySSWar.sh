if [ "$UID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

tomcatdir="/opt/apache-tomcat-8.0.30"

jerseyDir="./jaxrs-ri"

#fIRST CLEAN THE OLD INSTALLATION...
#Stop the tomcat server

$tomcatdir/bin/shutdown.sh

rm -rf $tomcatdir/webapps/ROOT.war
rm -rf $tomcatdir/webapps/ROOT


rm $tomcatdir/logs/*

cp ./target/ROOT.war  $tomcatdir/webapps

#cp $jerseyDir/ext/* $tomcatdir/lib

$tomcatdir/bin/startup.sh

curl http://localhost:8080/SimpleSarkarApp/views/login.jsp

sleep 10

curl http://localhost:8080/SimpleSarkarApp/views/login.jsp

#sleep 20

#cp $jerseyDir/api/javax.ws.rs-api*.* $tomcatdir/webapps/ROOT/WEB-INF/lib

#cp $jerseyDir/lib/* $tomcatdir/webapps/ROOT/WEB-INF/lib


#$tomcatdir/bin/shutdown.sh


#$tomcatdir/bin/startup.sh
