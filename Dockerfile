FROM openjdk:8-jdk

# A few problems with compiling Java from source:
#  1. Oracle.  Licensing prevents us from redistributing the official JDK.
#  2. Compiling OpenJDK also requires the JDK to be installed, and it gets
#       really hairy.

RUN apt-get update && apt-get install -y --no-install-recommends \
		unzip \
		pylint \
&& rm -rf /var/lib/apt/lists/*

RUN \
	wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-2.8.zip \
	&& unzip sonar-scanner-2.8.zip \
	&& mv sonar-scanner-2.8 /opt/sonar-scanner-2.8 \
	&& chmod +x /opt/sonar-scanner-2.8/bin/sonar-scanner
