build:
	mvn compile

package: build
	mvn package

run: build package
	java -cp "lib/*:target/*" org.example.Main

run2: build package
	mvn exec:java -Dexec.mainClass="org.example.Main"
