FROM sonarqube:latest
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN wget "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip" \
    | tar xf sonar-scanner
ENV PATH `pwd`/sonar-scanner/bin:$PATH
ENTRYPOINT ["./bin/run.sh"]
