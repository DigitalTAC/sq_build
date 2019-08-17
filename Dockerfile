FROM sonarqube:latest
RUN wget "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip" \
    | tar xf sonar-scanner
ENV PATH `pwd`/sonar-scanner/bin:$PATH
ENTRYPOINT ["./bin/run.sh"]
